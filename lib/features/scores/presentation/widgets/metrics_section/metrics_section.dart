import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';
import 'health_sibling_tiles.dart';
import 'sub_metric_tiles.dart';

class MetricsSection extends StatelessWidget {
  const MetricsSection({
    required this.detail,
    required this.timeframe,
    required this.selectedDate,
    this.siblingDetails = const [],
    this.siblingSummaries = const [],
    this.onSiblingTap,
    super.key,
  });

  final ScoreDetail detail;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final List<ScoreDetail> siblingDetails;
  final List<ScoreSummary> siblingSummaries;
  final ValueChanged<ScoreSummary>? onSiblingTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final renderSiblings = detail.type == ScoreType.health;
    final showAvg = timeframe != Timeframe.d1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.sectionMetrics,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            if (showAvg)
              Text(
                l10n.labelAvg,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (renderSiblings)
          HealthSiblingTiles(
            siblingDetails: siblingDetails,
            siblingSummaries: siblingSummaries,
            timeframe: timeframe,
            selectedDate: selectedDate,
            onSiblingTap: onSiblingTap,
          )
        else
          SubMetricTiles(
            detail: detail,
            timeframe: timeframe,
            selectedDate: selectedDate,
            iconColor: context.colors.primary,
            locale: Localizations.localeOf(context).toString(),
            noDataLabel: l10n.labelNoData,
            avgLabel: l10n.labelAvg,
          ),
      ],
    );
  }
}
