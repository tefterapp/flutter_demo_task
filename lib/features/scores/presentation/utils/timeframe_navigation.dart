import 'package:intl/intl.dart';

import '../../domain/entities/score_type.dart';

DateTime weekEndSunday(DateTime d) {
  final day = DateTime(d.year, d.month, d.day);
  final daysToSunday = DateTime.sunday - day.weekday;
  return day.add(Duration(days: daysToSunday));
}

DateTime weekStartMonday(DateTime d) {
  final day = DateTime(d.year, d.month, d.day);
  final daysFromMonday = day.weekday - DateTime.monday;
  return day.subtract(Duration(days: daysFromMonday));
}

DateTime shiftAnchorDate(Timeframe tf, DateTime anchor, int direction) {
  final a = DateTime(anchor.year, anchor.month, anchor.day);
  switch (tf) {
    case Timeframe.d1:
      return a.add(Duration(days: direction));
    case Timeframe.d7:
      final end = weekEndSunday(a);
      return end.add(Duration(days: 7 * direction));
    case Timeframe.d30:
      final targetMonth = DateTime(a.year, a.month + direction);
      final daysInTargetMonth =
          DateTime(targetMonth.year, targetMonth.month + 1, 0).day;
      final clampedDay = a.day.clamp(1, daysInTargetMonth);
      return DateTime(targetMonth.year, targetMonth.month, clampedDay);
    case Timeframe.y1:
      final target = DateTime(a.year + direction, a.month);
      final daysInTargetMonth =
          DateTime(target.year, target.month + 1, 0).day;
      final clampedDay = a.day.clamp(1, daysInTargetMonth);
      return DateTime(target.year, target.month, clampedDay);
  }
}

bool canGoForward({
  required Timeframe timeframe,
  required DateTime anchorDate,
  required DateTime todayDate,
}) {
  final a = DateTime(anchorDate.year, anchorDate.month, anchorDate.day);
  final t = DateTime(todayDate.year, todayDate.month, todayDate.day);
  switch (timeframe) {
    case Timeframe.d1:
      return a.isBefore(t);
    case Timeframe.d7:
      // Allow navigating to a partial week that still contains today.
      // Forward is only disabled once the next week's Monday is past today.
      final next = shiftAnchorDate(Timeframe.d7, a, 1);
      final nextStart = weekStartMonday(next);
      return !nextStart.isAfter(t);
    case Timeframe.d30:
      final currentMonth = DateTime(t.year, t.month);
      final nextMonth = DateTime(a.year, a.month + 1);
      return !nextMonth.isAfter(currentMonth);
    case Timeframe.y1:
      return a.year < t.year;
  }
}

String timeRangeLabel({
  required Timeframe timeframe,
  required DateTime anchorDate,
  required String locale,
}) {
  final a = DateTime(anchorDate.year, anchorDate.month, anchorDate.day);
  switch (timeframe) {
    case Timeframe.d1:
      return DateFormat('d MMM', locale).format(a);
    case Timeframe.d7:
      final start = weekStartMonday(a);
      final end = weekEndSunday(a);
      final fmt = DateFormat('d MMM', locale);
      return '${fmt.format(start)} - ${fmt.format(end)}';
    case Timeframe.d30:
      return DateFormat('MMM', locale).format(a);
    case Timeframe.y1:
      return DateFormat('y', locale).format(a);
  }
}
