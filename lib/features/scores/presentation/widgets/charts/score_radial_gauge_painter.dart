import 'dart:math' as math;

import 'package:flutter/material.dart';

class ScoreRadialGaugePainter extends CustomPainter {
  const ScoreRadialGaugePainter({
    required this.value0to1,
    required this.accentColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  final double value0to1;
  final Color accentColor;
  final Color trackColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final padding = strokeWidth / 2;
    final maxR = math.min(size.width / 2 - padding, size.height / 2 - padding);
    final r = math.max<double>(0, maxR);
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: r);

    const startAngle = -math.pi / 2;
    const sweepFull = math.pi * 2;

    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = trackColor;

    canvas.drawArc(rect, startAngle, sweepFull, false, trackPaint);

    final t = value0to1.clamp(0.0, 1.0);
    if (t <= 0) {
      return;
    }

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = accentColor;

    canvas.drawArc(rect, startAngle, sweepFull * t, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant ScoreRadialGaugePainter oldDelegate) {
    return oldDelegate.value0to1 != value0to1 ||
        oldDelegate.accentColor != accentColor ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
