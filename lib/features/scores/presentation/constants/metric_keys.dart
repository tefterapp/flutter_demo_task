import '../../domain/entities/score_type.dart';

abstract final class MetricKeys {
  MetricKeys._();

  static const String sleep = 'sleep';
  static const String restingHr = 'restingHr';
  static const String hrv = 'hrv';

  static const String activePoints = 'activePoints';
  static const String steps = 'steps';
  static const String moveHours = 'moveHours';
  static const String activeCalories = 'activeCalories';

  static const String health = 'health';
  static const String readiness = 'readiness';
  static const String activity = 'activity';
}

extension ScoreTypeIconKey on ScoreType {
  String get iconKey => name;
}
