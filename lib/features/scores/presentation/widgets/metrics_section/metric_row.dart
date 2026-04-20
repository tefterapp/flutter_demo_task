import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/metric_math.dart';
import '../metric_card.dart';

class MetricRow extends StatelessWidget {
  const MetricRow({
    required this.metricKey,
    required this.detail,
    required this.timeframe,
    required this.selectedDate,
    required this.locale,
    required this.iconColor,
    required this.noDataLabel,
    required this.avgLabel,
    super.key,
  });

  final String metricKey;
  final ScoreDetail detail;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final String locale;
  final Color iconColor;
  final String noDataLabel;
  final String avgLabel;

  @override
  Widget build(BuildContext context) {
    final series = detail.metrics[metricKey] ?? const [];
    final empty = metricSeriesIsEmpty(series);
    final numeric = empty
        ? null
        : metricValueForTimeframe(
            series: series,
            timeframe: timeframe,
            anchorDate: selectedDate,
          );
    final valueText = empty || numeric == null
        ? noDataLabel
        : formatMetricValue(metricKey, numeric, locale: locale);
    final progress = empty || numeric == null
        ? null
        : progress0to100ForMetric(metricKey, numeric);
    return MetricCard(
      title: metricTitle(context.l10n, metricKey, detail.definitions),
      icon: metricKey,
      iconColor: iconColor,
      valueText: valueText,
      isEmpty: empty,
      avgLabel: avgLabel,
      progress0to100: progress,
    );
  }
}
