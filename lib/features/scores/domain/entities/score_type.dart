export 'timeframe.dart';

enum ScoreType {
  health,
  readiness,
  activity,
}

extension ScoreTypeJson on ScoreType {
  String get jsonKey {
    switch (this) {
      case ScoreType.health:
        return 'health';
      case ScoreType.readiness:
        return 'readiness';
      case ScoreType.activity:
        return 'activity';
    }
  }
}
