import 'package:flutter/material.dart';

import '../../../../../core/extensions/iterable_first_or_null.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/metric_math.dart';
import '../sibling_score_tile.dart';

class HealthSiblingTiles extends StatelessWidget {
  const HealthSiblingTiles({
    required this.siblingDetails,
    required this.siblingSummaries,
    required this.timeframe,
    required this.selectedDate,
    required this.onSiblingTap,
    super.key,
  });

  final List<ScoreDetail> siblingDetails;
  final List<ScoreSummary> siblingSummaries;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final ValueChanged<ScoreSummary>? onSiblingTap;

  static const List<ScoreType> _order = [
    ScoreType.readiness,
    ScoreType.activity,
  ];

  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[];

    for (final type in _order) {
      final detail = siblingDetails.firstWhereOrNull((d) => d.type == type);
      if (detail == null) continue;
      final summary = siblingSummaries.firstWhereOrNull((s) => s.type == type);
      final score = scoreValueForTimeframe(
        points: detail.points,
        timeframe: timeframe,
        anchorDate: selectedDate,
      );
      tiles.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SiblingScoreTile(
            type: type,
            score: score,
            onTap: (onSiblingTap == null || summary == null)
                ? null
                : () => onSiblingTap!(summary),
          ),
        ),
      );
    }

    if (tiles.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: tiles,
    );
  }
}
