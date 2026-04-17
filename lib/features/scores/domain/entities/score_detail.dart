import 'package:equatable/equatable.dart';

import 'metric_definition.dart';
import 'metric_point.dart';
import 'score_point.dart';
import 'score_type.dart';

export 'metric_definition.dart';
export 'metric_point.dart';
export 'score_point.dart';

class ScoreDetail extends Equatable {
  const ScoreDetail({
    required this.type,
    required this.timeframe,
    required this.points,
    required this.metrics,
    required this.insights,
    required this.definitions,
  });

  final ScoreType type;
  final Timeframe timeframe;
  final List<ScorePoint> points;
  final Map<String, List<MetricPoint>> metrics;
  final List<String> insights;
  final List<MetricDefinition> definitions;

  @override
  List<Object?> get props => [
        type,
        timeframe,
        points,
        _metricsAsProps,
        insights,
        definitions,
      ];

  // Flatten nested Map<String, List<MetricPoint>> so Equatable's iterable
  // equality compares by value and is stable across key ordering.
  List<Object?> get _metricsAsProps {
    final sortedKeys = metrics.keys.toList()..sort();
    final flat = <Object?>[];
    for (final k in sortedKeys) {
      flat
        ..add(k)
        ..addAll(metrics[k]!);
    }
    return flat;
  }
}
