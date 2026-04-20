import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/ui/app_assets.dart';
import '../../../../../core/ui/app_colors.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/metric_math.dart';
import '../charts/score_radial_gauge.dart';
import '../charts/score_trend_chart.dart';

class ScoreCardChartArea extends StatelessWidget {
  const ScoreCardChartArea({
    required this.detail,
    required this.timeframe,
    required this.selectedDate,
    required this.accentColor,
    this.gaugeAreaHeight = 240,
    this.gaugeSize = 140,
    this.chartHeight = 200,
    super.key,
  });

  final ScoreDetail detail;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final Color accentColor;
  final double gaugeAreaHeight;
  final double gaugeSize;
  final double chartHeight;

  @override
  Widget build(BuildContext context) {
    if (timeframe == Timeframe.d1) {
      final scoreValue = scoreValueAt(detail.points, selectedDate);
      final value0to1 = scoreValue == null
          ? 0.0
          : (scoreValue / 100).clamp(0.0, 1.0);
      final centerText = scoreValue == null
          ? '–'
          : scoreValue.round().toString();
      return SizedBox(
        height: gaugeAreaHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                  child: const VectorGraphic(
                    loader: AssetBytesLoader(AppAssets.radialDots),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: gaugeSize,
              height: gaugeSize,
              decoration: BoxDecoration(
                color: AppColors.gaugeInnerSurface(context),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: ScoreRadialGauge(
                value0to1: value0to1,
                accentColor: accentColor,
                centerText: centerText,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: chartHeight,
      child: ScoreTrendChart(
        points: detail.points,
        accentColor: accentColor,
        timeframe: timeframe,
        anchorDate: selectedDate,
        emptyText: context.l10n.labelNoData,
      ),
    );
  }
}
