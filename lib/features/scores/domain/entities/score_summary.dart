import 'package:equatable/equatable.dart';

import 'score_type.dart';

class ScoreSummary extends Equatable {
  const ScoreSummary({
    required this.type,
    required this.currentScore,
    required this.valueLabel,
  });

  final ScoreType type;
  final int currentScore;
  final String valueLabel;

  @override
  List<Object?> get props => [type, currentScore, valueLabel];
}
