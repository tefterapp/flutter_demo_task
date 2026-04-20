import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/ui/app_assets.dart';
import '../../../../core/ui/app_colors.dart';
import '../constants/metric_keys.dart';

class MetricIcon extends StatelessWidget {
  const MetricIcon({required this.keyName, required this.color, super.key});

  final String keyName;
  final Color color;

  static const double _iconSize = 20;

  static const Map<String, String> _svgAssets = {
    MetricKeys.sleep: AppAssets.iconSleep,
    MetricKeys.readiness: AppAssets.iconSleep,
    MetricKeys.restingHr: AppAssets.iconRestingHr,
    MetricKeys.hrv: AppAssets.iconHrv,
  };

  static const Map<String, IconData> _materialIcons = {
    MetricKeys.activePoints: Icons.star_rounded,
    MetricKeys.steps: Icons.directions_walk_rounded,
    MetricKeys.moveHours: Icons.access_time_filled_rounded,
    MetricKeys.activeCalories: Icons.local_fire_department_rounded,
    MetricKeys.activity: Icons.local_fire_department_rounded,
  };

  static final Map<String, Color> _tintOverrides = {
    MetricKeys.activePoints: AppColors.metricIconLightGreen,
    MetricKeys.steps: AppColors.metricIconLightGreen,
    MetricKeys.moveHours: AppColors.metricIconLightBlue,
    MetricKeys.activeCalories: AppColors.metricIconOrange,
    MetricKeys.activity: AppColors.metricIconGreen,
  };

  @override
  Widget build(BuildContext context) {
    final svg = _svgAssets[keyName];
    if (svg != null) {
      return SizedBox(
        width: _iconSize,
        height: _iconSize,
        child: VectorGraphic(loader: AssetBytesLoader(svg)),
      );
    }
    return Icon(
      _materialIcons[keyName] ?? Icons.insights_rounded,
      size: _iconSize,
      color: _tintOverrides[keyName] ?? color,
    );
  }
}
