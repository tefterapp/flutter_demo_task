import 'package:flutter/widgets.dart';

class ScoreCardSize {
  const ScoreCardSize({
    required this.gaugeAreaHeight,
    required this.gaugeSize,
    required this.chartHeight,
    required this.contentPadding,
  });

  final double gaugeAreaHeight;
  final double gaugeSize;
  final double chartHeight;
  final EdgeInsets contentPadding;

  static const compact = ScoreCardSize(
    gaugeAreaHeight: 150,
    gaugeSize: 110,
    chartHeight: 140,
    contentPadding: EdgeInsets.all(12),
  );

  static const full = ScoreCardSize(
    gaugeAreaHeight: 200,
    gaugeSize: 140,
    chartHeight: 200,
    contentPadding: EdgeInsets.zero,
  );
}
