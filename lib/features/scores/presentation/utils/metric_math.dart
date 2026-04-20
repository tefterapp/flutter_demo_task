import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/score_detail.dart';
import '../../domain/entities/score_type.dart';
import '../constants/metric_keys.dart';
import 'timeframe_navigation.dart';

List<String> metricKeysForScoreType(ScoreType type) {
  switch (type) {
    case ScoreType.activity:
      return const [
        MetricKeys.activePoints,
        MetricKeys.steps,
        MetricKeys.activeCalories,
        MetricKeys.moveHours,
      ];
    case ScoreType.readiness:
      return const [MetricKeys.sleep, MetricKeys.restingHr, MetricKeys.hrv];
    case ScoreType.health:
      return const [
        MetricKeys.sleep,
        MetricKeys.restingHr,
        MetricKeys.hrv,
        MetricKeys.activePoints,
        MetricKeys.activeCalories,
        MetricKeys.steps,
        MetricKeys.moveHours,
      ];
  }
}

double? metricValueOnDay(List<MetricPoint> points, DateTime selectedDay) {
  if (points.isEmpty) {
    return null;
  }

  final target = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
  double? candidate;

  final sorted = [...points]..sort((a, b) => a.date.compareTo(b.date));
  for (final p in sorted) {
    final local = p.date.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    final v = p.value;
    if (v == null) continue;
    if (day.isBefore(target)) continue;
    if (day.isAfter(target)) break;
    candidate = v;
  }

  return candidate;
}

bool metricSeriesIsEmpty(List<MetricPoint> points) =>
    !points.any((p) => p.value != null);

String metricTitle(
  AppLocalizations l10n,
  String key,
  List<MetricDefinition> definitions,
) {
  switch (key) {
    case MetricKeys.sleep:
      return l10n.metricTitleSleep;
    case MetricKeys.restingHr:
      return l10n.metricTitleRestingHr;
    case MetricKeys.hrv:
      return l10n.metricTitleOvernightHrv;
    case MetricKeys.activePoints:
      return l10n.metricTitleActivePoints;
    case MetricKeys.steps:
      return l10n.metricTitleSteps;
    case MetricKeys.activeCalories:
      return l10n.metricTitleActiveCalories;
    case MetricKeys.moveHours:
      return l10n.metricTitleMoveHours;
  }

  for (final d in definitions) {
    if (d.key == key) {
      return d.title;
    }
  }
  if (key.isEmpty) {
    return key;
  }
  return key[0].toUpperCase() + key.substring(1);
}

String formatMetricValue(String key, double value, {String? locale}) {
  switch (key) {
    case MetricKeys.steps:
    case MetricKeys.activeCalories:
    case MetricKeys.restingHr:
      return NumberFormat.decimalPattern(locale).format(value.round());
    case MetricKeys.hrv:
      return value.round().toString();
    case MetricKeys.sleep:
    case MetricKeys.moveHours:
    case MetricKeys.activePoints:
      return value.toStringAsFixed(1);
    default:
      return value.toStringAsFixed(1);
  }
}

String formatMetricValueWithUnit(String key, double value, {String? locale}) {
  switch (key) {
    case MetricKeys.sleep:
    case MetricKeys.moveHours:
      final hours = value.floor();
      final minutes = ((value - hours) * 60).round();
      if (minutes == 0) {
        return '$hours h';
      }
      return '$hours h $minutes min';
    case MetricKeys.restingHr:
      return '${NumberFormat.decimalPattern(locale).format(value.round())} bpm';
    case MetricKeys.hrv:
      return '${value.round()} ms';
    case MetricKeys.activePoints:
      return '${value.round()} pts';
    case MetricKeys.steps:
      return NumberFormat.decimalPattern(locale).format(value.round());
    case MetricKeys.activeCalories:
      return '${NumberFormat.decimalPattern(locale).format(value.round())} kcal';
    default:
      return formatMetricValue(key, value, locale: locale);
  }
}

double progress0to100ForMetric(String key, double value) {
  double linear(double v, double max) => ((v / max) * 100).clamp(0.0, 100.0);

  switch (key) {
    case MetricKeys.steps:
      return linear(value, 12000);
    case MetricKeys.activeCalories:
      return linear(value, 800);
    case MetricKeys.moveHours:
      return linear(value, 12);
    case MetricKeys.sleep:
      return linear(value, 9);
    case MetricKeys.hrv:
      return linear(value, 70);
    case MetricKeys.activePoints:
      return linear(value, 30);
    case MetricKeys.restingHr:
      // Lower BPM is better: map 45→100, 80→0.
      const minBpm = 45.0;
      const maxBpm = 80.0;
      final t = ((maxBpm - value) / (maxBpm - minBpm)).clamp(0.0, 1.0);
      return t * 100;
    default:
      return linear(value, 100);
  }
}

Color metricProgressColor(double progress0to100) {
  if (progress0to100 < 50) {
    return AppColors.metricProgressLow;
  }
  if (progress0to100 < 80) {
    return AppColors.metricProgressMid;
  }
  return AppColors.metricProgressHigh;
}

double? scoreValueAt(List<ScorePoint> points, DateTime selectedDay) {
  final target = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
  double? candidate;

  final sorted = [...points]..sort((a, b) => a.date.compareTo(b.date));
  for (final p in sorted) {
    final local = p.date.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    final v = p.value;
    if (v == null) continue;
    if (day.isBefore(target)) continue;
    if (day.isAfter(target)) break;
    candidate = v;
  }
  return candidate;
}

double? scoreValueForTimeframe({
  required List<ScorePoint> points,
  required Timeframe timeframe,
  required DateTime anchorDate,
}) {
  final (start, end) = _windowFor(timeframe, anchorDate);
  if (start == null || end == null) {
    return scoreValueAt(points, anchorDate);
  }
  return _averageValueInWindow(points, start, end);
}

(DateTime?, DateTime?) _windowFor(Timeframe timeframe, DateTime anchorDate) {
  switch (timeframe) {
    case Timeframe.d1:
      return (null, null);
    case Timeframe.d7:
      final start = weekStartMonday(anchorDate);
      return (start, start.add(const Duration(days: 6)));
    case Timeframe.d30:
      return (
        DateTime(anchorDate.year, anchorDate.month),
        DateTime(anchorDate.year, anchorDate.month + 1, 0),
      );
    case Timeframe.y1:
      return (DateTime(anchorDate.year), DateTime(anchorDate.year, 12, 31));
  }
}

double? _averageValueInWindow(
  List<ScorePoint> points,
  DateTime startDay,
  DateTime endDay,
) {
  var sum = 0.0;
  var count = 0;
  for (final p in points) {
    final v = p.value;
    if (v == null) continue;
    final local = p.date.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    if (day.isBefore(startDay) || day.isAfter(endDay)) continue;
    sum += v;
    count++;
  }
  return count == 0 ? null : sum / count;
}

double? metricValueForTimeframe({
  required List<MetricPoint> series,
  required Timeframe timeframe,
  required DateTime anchorDate,
}) {
  final (start, end) = _windowFor(timeframe, anchorDate);
  if (start == null || end == null) {
    return metricValueOnDay(series, anchorDate);
  }
  return _averageMetricInWindow(series, start, end);
}

double? _averageMetricInWindow(
  List<MetricPoint> series,
  DateTime startDay,
  DateTime endDay,
) {
  var sum = 0.0;
  var count = 0;
  for (final p in series) {
    final v = p.value;
    if (v == null) continue;
    final local = p.date.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    if (day.isBefore(startDay) || day.isAfter(endDay)) continue;
    sum += v;
    count++;
  }
  return count == 0 ? null : sum / count;
}
