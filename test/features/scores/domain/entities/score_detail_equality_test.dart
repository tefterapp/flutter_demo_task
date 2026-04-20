import 'package:flutter_demo_task/features/scores/domain/entities/score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ScoreDetail build() => ScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
        points: [ScorePoint(date: DateTime(2026, 4, 16), value: 72.5)],
        metrics: {
          'steps': [MetricPoint(date: DateTime(2026, 4, 16), value: 8000)],
          'sleep': [MetricPoint(date: DateTime(2026, 4, 16), value: 7)],
        },
        insights: const ['a'],
        definitions: const [
          MetricDefinition(key: 'steps', title: 'Steps', description: 'd'),
        ],
      );

  test('value-equal instances compare equal and share hashCode', () {
    expect(build(), build());
    expect(build().hashCode, build().hashCode);
  });

  test('different metric values produce inequality', () {
    final a = build();
    final b = ScoreDetail(
      type: a.type,
      timeframe: a.timeframe,
      points: a.points,
      metrics: {
        'steps': [MetricPoint(date: DateTime(2026, 4, 16), value: 8001)],
        'sleep': a.metrics['sleep']!,
      },
      insights: a.insights,
      definitions: a.definitions,
    );
    expect(a == b, isFalse);
  });
}
