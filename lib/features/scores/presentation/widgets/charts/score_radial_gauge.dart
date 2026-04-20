import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import 'score_radial_gauge_painter.dart';

class ScoreRadialGauge extends StatelessWidget {
  const ScoreRadialGauge({
    required this.value0to1,
    required this.accentColor,
    required this.centerText,
    this.strokeWidth = 6,
    super.key,
  });

  final double value0to1;
  final Color accentColor;
  final String centerText;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: ScoreRadialGaugePainter(
            value0to1: value0to1,
            accentColor: accentColor,
            trackColor: context.colors.outlineVariant,
            strokeWidth: strokeWidth,
          ),
          child: const SizedBox.expand(),
        ),
        Text(centerText, style: context.textTheme.headlineMedium),
      ],
    );
  }
}
