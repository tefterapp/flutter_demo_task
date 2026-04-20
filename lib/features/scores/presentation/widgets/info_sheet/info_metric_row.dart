import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../utils/metric_math.dart';
import '../metric_icon.dart';

class InfoMetricRow extends StatelessWidget {
  const InfoMetricRow({
    required this.metricKey,
    required this.detail,
    required this.selectedDate,
    required this.locale,
    required this.noDataLabel,
    super.key,
  });

  final String metricKey;
  final ScoreDetail detail;
  final DateTime selectedDate;
  final String locale;
  final String noDataLabel;

  @override
  Widget build(BuildContext context) {
    final series = detail.metrics[metricKey] ?? const [];
    final empty = metricSeriesIsEmpty(series);
    final value = empty ? null : metricValueOnDay(series, selectedDate);
    final valueText = empty || value == null
        ? noDataLabel
        : formatMetricValueWithUnit(metricKey, value, locale: locale);
    final score = empty || value == null
        ? null
        : progress0to100ForMetric(metricKey, value).round();

    final title = metricTitle(context.l10n, metricKey, detail.definitions);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                MetricIcon(keyName: metricKey, color: context.colors.primary),
              ],
            ),
          ),
          Text(
            valueText,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.star_rounded, size: 18, color: context.colors.onSurface),
          const SizedBox(width: 4),
          SizedBox(
            width: 28,
            child: Text(
              score?.toString() ?? '–',
              textAlign: TextAlign.right,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
