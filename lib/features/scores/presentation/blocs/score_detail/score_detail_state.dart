import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';

part 'score_detail_state.freezed.dart';

@freezed
sealed class ScoreDetailState with _$ScoreDetailState {
  const factory ScoreDetailState.initial({
    required ScoreSummary summary,
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) = ScoreDetailInitial;

  const factory ScoreDetailState.loading({
    required ScoreSummary summary,
    required Timeframe timeframe,
    required DateTime selectedDate,
  }) = ScoreDetailLoading;

  const factory ScoreDetailState.success({
    required ScoreSummary summary,
    required Timeframe timeframe,
    required DateTime selectedDate,
    required ScoreDetail detail,
    required bool isEmpty,
    @Default(<ScoreDetail>[]) List<ScoreDetail> siblingDetails,
  }) = ScoreDetailSuccess;

  const factory ScoreDetailState.failure({
    required ScoreSummary summary,
    required Timeframe timeframe,
    required DateTime selectedDate,
    required Failure failure,
  }) = ScoreDetailFailure;
}
