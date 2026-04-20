import '../../domain/entities/score_detail.dart';
import '../../domain/entities/score_type.dart';

bool scoreDetailIsEmpty(ScoreDetail detail) {
  final hasPointValue = detail.points.any((p) => p.value != null);
  if (hasPointValue) {
    return false;
  }
  for (final series in detail.metrics.values) {
    if (series.any((m) => m.value != null)) {
      return false;
    }
  }
  return true;
}

/// Types whose detail needs to be fetched alongside [main] to render sibling
/// summary tiles. Only Health currently requires siblings.
List<ScoreType> siblingTypesFor(ScoreType main) {
  switch (main) {
    case ScoreType.health:
      return const [ScoreType.readiness, ScoreType.activity];
    case ScoreType.readiness:
    case ScoreType.activity:
      return const [];
  }
}
