import 'package:intl/intl.dart';

import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_type.dart';

class BucketedSeries {
  const BucketedSeries({required this.labels, required this.values});

  final List<String> labels;
  final List<double?> values;
}

BucketedSeries bucketedSeries({
  required List<ScorePoint> points,
  required Timeframe timeframe,
  required String locale,
  required DateTime anchorDate,
}) {
  final end = DateTime(anchorDate.year, anchorDate.month, anchorDate.day);

  switch (timeframe) {
    case Timeframe.d7:
      final monday = end.subtract(
        Duration(days: end.weekday - DateTime.monday),
      );
      final labels = <String>[];
      final values = <double?>[];
      for (var i = 0; i < 7; i++) {
        final day = DateTime(monday.year, monday.month, monday.day + i);
        labels.add(DateFormat('EEE', locale).format(day));
        values.add(_lastValueForDay(points, day));
      }
      return BucketedSeries(labels: labels, values: values);

    case Timeframe.d30:
      final monthStart = DateTime(end.year, end.month);
      final daysInMonth = DateTime(end.year, end.month + 1, 0).day;
      final labels = <String>[];
      final values = <double?>[];
      for (var d = 1; d <= daysInMonth; d++) {
        final day = DateTime(monthStart.year, monthStart.month, d);
        labels.add('$d');
        values.add(_lastValueForDay(points, day));
      }
      return BucketedSeries(labels: labels, values: values);

    case Timeframe.y1:
      final labels = <String>[];
      final values = <double?>[];
      for (var m = 1; m <= 12; m++) {
        final month = DateTime(end.year, m);
        labels.add(DateFormat('MMM', locale).format(month));
        values.add(_lastValueForMonth(points, year: end.year, month: m));
      }
      return BucketedSeries(labels: labels, values: values);

    case Timeframe.d1:
      return const BucketedSeries(labels: <String>[], values: <double?>[]);
  }
}

double? _lastValueForDay(List<ScorePoint> points, DateTime day) {
  final target = DateTime(day.year, day.month, day.day);
  double? candidate;
  DateTime? candidateAt;

  for (final p in points) {
    final v = p.value;
    if (v == null) continue;

    final local = p.date.toLocal();
    final pDay = DateTime(local.year, local.month, local.day);
    if (pDay != target) continue;

    if (candidateAt == null || local.isAfter(candidateAt)) {
      candidate = v;
      candidateAt = local;
    }
  }

  return candidate;
}

double? _lastValueForMonth(
  List<ScorePoint> points, {
  required int year,
  required int month,
}) {
  double? candidate;
  DateTime? candidateAt;

  for (final p in points) {
    final v = p.value;
    if (v == null) continue;

    final local = p.date.toLocal();
    if (local.year != year || local.month != month) continue;

    if (candidateAt == null || local.isAfter(candidateAt)) {
      candidate = v;
      candidateAt = local;
    }
  }

  return candidate;
}

bool shouldShowBottomTick({
  required Timeframe timeframe,
  required int index,
  required int length,
}) {
  switch (timeframe) {
    case Timeframe.d7:
      return true;
    case Timeframe.y1:
      return true;
    case Timeframe.d30:
      final day = index + 1;
      final isLast = index == length - 1;
      return day == 1 || day % 5 == 0 || isLast;
    case Timeframe.d1:
      return false;
  }
}

const double _trendBarWidth = 6;
double barWidthFor(int n) => _trendBarWidth;
