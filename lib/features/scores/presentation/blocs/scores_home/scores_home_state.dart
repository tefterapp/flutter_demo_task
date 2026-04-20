import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/home_score_card.dart';

part 'scores_home_state.freezed.dart';

@freezed
sealed class ScoresHomeState with _$ScoresHomeState {
  const factory ScoresHomeState.initial() = ScoresHomeInitial;
  const factory ScoresHomeState.loading() = ScoresHomeLoading;
  const factory ScoresHomeState.success({required List<HomeScoreCard> cards})
      = ScoresHomeSuccess;
  const factory ScoresHomeState.empty() = ScoresHomeEmpty;
  const factory ScoresHomeState.failure({required Failure failure})
      = ScoresHomeFailure;
}
