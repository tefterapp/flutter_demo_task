import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../utils/metric_math.dart';
import 'info_metric_row.dart';

class InfoMetricsList extends StatelessWidget {
  const InfoMetricsList({
    required this.detail,
    required this.selectedDate,
    required this.locale,
    required this.noDataLabel,
    super.key,
  });

  final ScoreDetail detail;
  final DateTime selectedDate;
  final String locale;
  final String noDataLabel;

  @override
  Widget build(BuildContext context) {
    final keys = metricKeysForScoreType(detail.type);
    if (keys.isEmpty) return const SizedBox.shrink();

    final outline = context.colors.outlineVariant;

    return Column(
      children: [
        for (var i = 0; i < keys.length; i++) ...[
          if (i > 0)
            Divider(
              height: 1,
              thickness: 1,
              color: outline.withValues(alpha: 0.4),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.02),
            ),
            child: InfoMetricRow(
              metricKey: keys[i],
              detail: detail,
              selectedDate: selectedDate,
              locale: locale,
              noDataLabel: noDataLabel,
            ),
          ),
        ],
      ],
    );
  }
}
