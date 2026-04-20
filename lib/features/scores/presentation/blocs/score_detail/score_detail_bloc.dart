import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/logging/app_logger.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';
import '../../../domain/usecases/get_score_detail.dart';
import '../../../domain/usecases/refresh_score_detail.dart';
import '../../utils/score_detail_helpers.dart';
import 'score_detail_event.dart';
import 'score_detail_state.dart';

class ScoreDetailBloc extends Bloc<ScoreDetailEvent, ScoreDetailState> {
  ScoreDetailBloc({
    required GetScoreDetail getScoreDetail,
    required RefreshScoreDetail refreshScoreDetail,
  }) : _getScoreDetail = getScoreDetail,
       _refreshScoreDetail = refreshScoreDetail,
       super(
         ScoreDetailState.initial(
           summary: _placeholderSummary,
           timeframe: Timeframe.d1,
           selectedDate: _todayDate(),
         ),
       ) {
    on<ScoreDetailStarted>(_onStarted);
    on<ScoreDetailRefreshed>(_onRefreshed);
    on<ScoreDetailTimeframeChanged>(_onTimeframeChanged);
    on<ScoreDetailDateChanged>(_onDateChanged);
  }

  static const _placeholderSummary = ScoreSummary(
    type: ScoreType.health,
    currentScore: 0,
    valueLabel: '',
  );

  static DateTime _todayDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  final GetScoreDetail _getScoreDetail;
  final RefreshScoreDetail _refreshScoreDetail;

  Completer<void>? _refreshCompleter;
  int _opId = 0;

  Future<void> waitForRefreshComplete() {
    final pending = _refreshCompleter;
    if (pending != null && !pending.isCompleted) {
      AppLogger.d('Detail · joining in-flight refresh');
      return pending.future;
    }
    final c = Completer<void>();
    _refreshCompleter = c;
    add(const ScoreDetailEvent.refreshed());
    return c.future;
  }

  void _completeRefreshIfPending() {
    final pending = _refreshCompleter;
    _refreshCompleter = null;
    if (pending != null && !pending.isCompleted) {
      pending.complete();
    }
  }

  Future<void> _onStarted(
    ScoreDetailStarted event,
    Emitter<ScoreDetailState> emit,
  ) async {
    final opId = ++_opId;
    final initialDate = state.selectedDate;
    emit(
      ScoreDetailState.loading(
        summary: event.summary,
        timeframe: Timeframe.d1,
        selectedDate: initialDate,
      ),
    );
    await _loadAll(
      emit,
      opId: opId,
      summary: event.summary,
      timeframe: Timeframe.d1,
      selectedDate: initialDate,
      refresh: true,
    );
  }

  Future<void> _onRefreshed(
    ScoreDetailRefreshed event,
    Emitter<ScoreDetailState> emit,
  ) async {
    final opId = ++_opId;
    final summary = state.summary;
    final timeframe = state.timeframe;
    final selectedDate = state.selectedDate;
    try {
      emit(
        ScoreDetailState.loading(
          summary: summary,
          timeframe: timeframe,
          selectedDate: selectedDate,
        ),
      );
      await _loadAll(
        emit,
        opId: opId,
        summary: summary,
        timeframe: timeframe,
        selectedDate: selectedDate,
        refresh: true,
      );
    } finally {
      _completeRefreshIfPending();
    }
  }

  @override
  Future<void> close() {
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      _refreshCompleter!.complete();
      _refreshCompleter = null;
    }
    return super.close();
  }

  Future<void> _onTimeframeChanged(
    ScoreDetailTimeframeChanged event,
    Emitter<ScoreDetailState> emit,
  ) async {
    final opId = ++_opId;
    final summary = state.summary;
    final newTf = event.timeframe;
    final selectedDate = state.selectedDate;
    emit(
      ScoreDetailState.loading(
        summary: summary,
        timeframe: newTf,
        selectedDate: selectedDate,
      ),
    );
    await _loadAll(
      emit,
      opId: opId,
      summary: summary,
      timeframe: newTf,
      selectedDate: selectedDate,
      refresh: false,
    );
  }

  void _onDateChanged(
    ScoreDetailDateChanged event,
    Emitter<ScoreDetailState> emit,
  ) {
    final today = _todayDate();
    final next = event.date.isAfter(today) ? today : event.date;

    emit(
      state.map(
        initial: (s) => s.copyWith(selectedDate: next),
        loading: (s) => s.copyWith(selectedDate: next),
        success: (s) => s.copyWith(selectedDate: next),
        failure: (s) => s.copyWith(selectedDate: next),
      ),
    );
  }

  Future<void> _loadAll(
    Emitter<ScoreDetailState> emit, {
    required int opId,
    required ScoreSummary summary,
    required Timeframe timeframe,
    required DateTime selectedDate,
    required bool refresh,
  }) async {
    final mainResult = await _fetchDetail(
      type: summary.type,
      timeframe: timeframe,
      refresh: refresh,
    );
    if (isClosed || opId != _opId) {
      return;
    }

    await mainResult.fold(
      (failure) {
        emit(
          ScoreDetailState.failure(
            summary: summary,
            timeframe: timeframe,
            selectedDate: selectedDate,
            failure: failure,
          ),
        );
      },
      (detail) async {
        final siblings = await _fetchSiblings(
          mainType: summary.type,
          timeframe: timeframe,
        );
        if (isClosed || opId != _opId) {
          return;
        }
        emit(
          ScoreDetailState.success(
            summary: summary,
            timeframe: timeframe,
            selectedDate: selectedDate,
            detail: detail,
            isEmpty: scoreDetailIsEmpty(detail),
            siblingDetails: siblings,
          ),
        );
      },
    );
  }

  Future<Either<Failure, ScoreDetail>> _fetchDetail({
    required ScoreType type,
    required Timeframe timeframe,
    required bool refresh,
  }) => refresh
      ? _refreshScoreDetail(type: type, timeframe: timeframe)
      : _getScoreDetail(type: type, timeframe: timeframe);

  /// Fetches sibling details in parallel via the read path. Sibling failures
  /// are tolerated so the main view still renders; the returned list simply
  /// omits unavailable ones.
  Future<List<ScoreDetail>> _fetchSiblings({
    required ScoreType mainType,
    required Timeframe timeframe,
  }) async {
    final types = siblingTypesFor(mainType);
    if (types.isEmpty) {
      return const <ScoreDetail>[];
    }
    final results = await Future.wait(
      types.map(
        (t) => _fetchDetail(type: t, timeframe: timeframe, refresh: false),
      ),
    );
    return [
      for (final either in results)
        either.fold<ScoreDetail?>((_) => null, (d) => d),
    ].whereType<ScoreDetail>().toList();
  }
}
