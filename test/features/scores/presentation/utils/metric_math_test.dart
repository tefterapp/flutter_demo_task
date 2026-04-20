import 'package:flutter_demo_task/features/scores/domain/entities/metric_point.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_point.dart';
import 'package:flutter_demo_task/features/scores/presentation/utils/metric_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('scoreValueAt', () {
    final apr16 = DateTime(2026, 4, 16);
    final apr17 = DateTime(2026, 4, 17);
    final apr18 = DateTime(2026, 4, 18);

    final points = [
      ScorePoint(date: apr16, value: 70),
      ScorePoint(date: apr17, value: 80),
    ];

    test('returns the reading recorded on the selected day', () {
      expect(scoreValueAt(points, apr17), 80);
      expect(scoreValueAt(points, apr16), 70);
    });

    test(
      'returns null when the selected day has no sample '
      '(no carry-forward from earlier days)',
      () {
        expect(scoreValueAt(points, apr18), isNull);
      },
    );

    test('returns null when the selected day is before every sample', () {
      expect(scoreValueAt(points, DateTime(2026, 4, 10)), isNull);
    });

    test('picks the last non-null intra-day sample', () {
      final multi = [
        ScorePoint(date: DateTime(2026, 4, 17, 6), value: 70),
        ScorePoint(date: DateTime(2026, 4, 17, 22), value: 85),
      ];
      expect(scoreValueAt(multi, apr17), 85);
    });
  });

  group('metricValueOnDay', () {
    final apr17 = DateTime(2026, 4, 17);
    final apr18 = DateTime(2026, 4, 18);

    final series = [
      MetricPoint(date: DateTime(2026, 4, 16), value: 7),
      MetricPoint(date: apr17, value: 8),
    ];

    test('returns the sample value for the exact day', () {
      expect(metricValueOnDay(series, apr17), 8);
    });

    test('does not fall back to an earlier day when the day is empty', () {
      expect(metricValueOnDay(series, apr18), isNull);
    });

    test('returns null for an empty series', () {
      expect(metricValueOnDay(const [], apr17), isNull);
    });
  });
}
