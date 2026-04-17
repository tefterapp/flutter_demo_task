import 'package:equatable/equatable.dart';

import 'score_detail.dart';
import 'score_summary.dart';
import 'score_type.dart';

class HomeScoreCard extends Equatable {
  const HomeScoreCard({required this.summary, required this.d1Detail});

  final ScoreSummary summary;
  final ScoreDetail d1Detail;

  @override
  List<Object?> get props => [summary, d1Detail];
}

extension HomeScoreCardsX on List<HomeScoreCard> {
  // Used by the home screen to hand "the other two scores" to the detail
  // page so Health detail can render Readiness + Activity as sibling tiles.
  List<ScoreSummary> siblingSummariesFor(ScoreType type) => [
        for (final card in this)
          if (card.summary.type != type) card.summary,
      ];
}
