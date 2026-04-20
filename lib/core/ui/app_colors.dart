import 'package:flutter/material.dart';

import '../../features/scores/domain/entities/score_type.dart';
import '../extensions/build_context_x.dart';

abstract final class AppColors {
  AppColors._();

  static const Color seed = Color(0xFF5B5BD6);

  static const Color scoreHealth = Color(0xFF3B82F6);
  static const Color scoreReadiness = Color(0xFF8B5CF6);
  static const Color scoreActivity = Color(0xFF34C759);

  static Color forScoreType(ScoreType type) {
    switch (type) {
      case ScoreType.health:
        return scoreHealth;
      case ScoreType.readiness:
        return scoreReadiness;
      case ScoreType.activity:
        return scoreActivity;
    }
  }

  static const Color metricIconLightGreen = Color(0xFF4CD964);
  static const Color metricIconLightBlue = Color(0xFF3ABEFF);
  static const Color metricIconOrange = Color(0xFFFF8A3D);
  static const Color metricIconGreen = Color(0xFF34C759);

  static const Color metricProgressLow = Color(0xFF9E9E9E);
  static const Color metricProgressMid = Color(0xFF2196F3);
  static const Color metricProgressHigh = Color(0xFF43A047);

  static Color gaugeInnerSurface(BuildContext context) {
    return context.isDarkMode
        ? context.colors.surfaceContainerHighest
        : const Color(0xFFFFFFFF);
  }
}
