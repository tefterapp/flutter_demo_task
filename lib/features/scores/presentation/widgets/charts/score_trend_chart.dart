import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_type.dart';
import 'bucketed_series.dart';

class ScoreTrendChart extends StatelessWidget {
  const ScoreTrendChart({
    required this.points,
    required this.accentColor,
    required this.timeframe,
    required this.anchorDate,
    this.emptyText = '—',
    super.key,
  });

  final List<ScorePoint> points;
  final Color accentColor;
  final Timeframe timeframe;
  final DateTime anchorDate;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final labelStyle = context.textTheme.labelSmall?.copyWith(
      color: colors.onSurface.withValues(alpha: 0.6),
    );

    final locale = Localizations.localeOf(context).toString();
    final series = bucketedSeries(
      points: points,
      timeframe: timeframe,
      locale: locale,
      anchorDate: anchorDate,
    );

    final hasAny = series.values.any((v) => v != null);
    if (!hasAny) {
      return Center(
        child: Text(
          emptyText,
          style: context.textTheme.titleMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      );
    }

    final barWidth = barWidthFor(series.labels.length);

    final groups = <BarChartGroupData>[];
    for (var i = 0; i < series.labels.length; i++) {
      final v = series.values[i];
      final rods = <BarChartRodData>[];
      if (v != null) {
        rods.add(
          BarChartRodData(
            toY: v.clamp(0, 100),
            color: accentColor,
            width: barWidth,
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }
      groups.add(BarChartGroupData(x: i, barRods: rods));
    }

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        barGroups: groups,
        alignment: BarChartAlignment.spaceBetween,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 25,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: colors.outlineVariant.withValues(alpha: 0.5)),
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: 100,
              color: colors.outlineVariant.withValues(alpha: 0.5),
              strokeWidth: 1,
            ),
          ],
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: colors.outlineVariant.withValues(alpha: 0.7),
            ),
          ),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          leftTitles: const AxisTitles(),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 34,
              interval: 25,
              getTitlesWidget: (value, meta) {
                if (value % 25 != 0) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    value.toInt().toString(),
                    style: labelStyle,
                    textAlign: TextAlign.left,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final i = value.round();
                if (i < 0 || i >= series.labels.length) {
                  return const SizedBox.shrink();
                }
                if (!shouldShowBottomTick(
                  timeframe: timeframe,
                  index: i,
                  length: series.labels.length,
                )) {
                  return const SizedBox.shrink();
                }

                final text = series.labels[i];
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(text, style: labelStyle),
                );
              },
            ),
          ),
        ),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.toStringAsFixed(0),
                context.textTheme.labelMedium!.copyWith(
                  color: colors.onInverseSurface,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ),
      ),
      duration: Duration.zero,
    );
  }
}
