import 'package:flutter/material.dart';

import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/metric_math.dart';
import 'metric_row.dart';

class SubMetricTiles extends StatelessWidget {
  const SubMetricTiles({
    required this.detail,
    required this.timeframe,
    required this.selectedDate,
    required this.iconColor,
    required this.locale,
    required this.noDataLabel,
    required this.avgLabel,
    super.key,
  });

  final ScoreDetail detail;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final Color iconColor;
  final String locale;
  final String noDataLabel;
  final String avgLabel;

  @override
  Widget build(BuildContext context) {
    final keys = metricKeysForScoreType(detail.type);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final key in keys)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MetricRow(
              metricKey: key,
              detail: detail,
              timeframe: timeframe,
              selectedDate: selectedDate,
              locale: locale,
              iconColor: iconColor,
              noDataLabel: noDataLabel,
              avgLabel: avgLabel,
            ),
          ),
      ],
    );
  }
}
