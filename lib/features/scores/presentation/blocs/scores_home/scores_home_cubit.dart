import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/logging/app_logger.dart';
import '../../../domain/entities/home_score_card.dart';
import '../../../domain/usecases/get_home_score_cards.dart';
import '../../../domain/usecases/refresh_home_score_cards.dart';
import 'scores_home_state.dart';

class ScoresHomeCubit extends Cubit<ScoresHomeState> {
  ScoresHomeCubit({
    required GetHomeScoreCards getHomeScoreCards,
    required RefreshHomeScoreCards refreshHomeScoreCards,
  }) : _getHomeScoreCards = getHomeScoreCards,
       _refreshHomeScoreCards = refreshHomeScoreCards,
       super(const ScoresHomeState.initial());

  final GetHomeScoreCards _getHomeScoreCards;
  final RefreshHomeScoreCards _refreshHomeScoreCards;

  Future<void> load() async {
    AppLogger.d('Home · loading scores');
    emit(const ScoresHomeState.loading());
    final result = await _getHomeScoreCards();
    if (isClosed) return;
    emit(
      result.fold((failure) {
        AppLogger.w('Home · load failed (${failure.runtimeType})');
        return ScoresHomeState.failure(failure: failure);
      }, _fromCards),
    );
  }

  Future<void> refresh() async {
    AppLogger.d('Home · refreshing scores');
    final result = await _refreshHomeScoreCards();
    if (isClosed) return;
    emit(
      result.fold((failure) {
        AppLogger.w('Home · refresh failed (${failure.runtimeType})');
        return ScoresHomeState.failure(failure: failure);
      }, _fromCards),
    );
  }

  Future<void> retry() async {
    AppLogger.d('Home · retrying after failure/empty');
    emit(const ScoresHomeState.loading());
    final result = await _refreshHomeScoreCards();
    if (isClosed) return;
    emit(
      result.fold((failure) {
        AppLogger.w('Home · retry failed (${failure.runtimeType})');
        return ScoresHomeState.failure(failure: failure);
      }, _fromCards),
    );
  }

  ScoresHomeState _fromCards(List<HomeScoreCard> cards) {
    if (cards.isEmpty) {
      AppLogger.i('Home · received empty card list');
      return const ScoresHomeState.empty();
    }
    AppLogger.d('Home · received ${cards.length} cards');
    return ScoresHomeState.success(cards: cards);
  }
}
