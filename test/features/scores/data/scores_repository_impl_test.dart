import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_task/features/scores/data/datasources/scores_local_datasource.dart';
import 'package:flutter_demo_task/features/scores/data/repositories/scores_repository_impl.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_test/flutter_test.dart';

final class _MapAssetBundle extends AssetBundle {
  _MapAssetBundle(this._assets);

  final Map<String, String> _assets;

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final value = _assets[key];
    if (value == null) {
      throw FlutterError('Unable to load asset: $key');
    }
    return value;
  }

  @override
  Future<ByteData> load(String key) async {
    throw UnsupportedError('load($key) not supported in test bundle');
  }
}

void main() {
  const assetPath = 'assets/mock/scores.json';

  /// Payload with definitions + metric/point values so empty-branch behavior is observable.
  final payloadJson = jsonEncode({
    'scores': [
      {
        'type': 'health',
        'currentScore': 72.5,
        'valueLabel': 'Good',
        'timeframes': {
          'd1': {
            'points': [
              {'date': '2026-04-15T06:00:00Z', 'value': 70.0},
            ],
            'metrics': {
              'steps': [
                {'date': '2026-04-15', 'value': 8420.0},
              ],
            },
            'insights': ['keep me'],
            'definitions': [
              {
                'key': 'steps',
                'title': 'Steps',
                'description': 'Daily step count.',
              },
            ],
          },
        },
      },
    ],
  });

  ScoresLocalDataSourceImpl localDataSource() {
    final bundle = _MapAssetBundle({assetPath: payloadJson});
    return ScoresLocalDataSourceImpl(bundle: bundle);
  }

  group('refreshHomeScores', () {
    test('r < 0.18 yields NetworkFailure', () async {
      final repo = ScoresRepositoryImpl(
        local: localDataSource(),
        random: () => 0.1,
        refreshDelay: Duration.zero,
      );

      final result = await repo.refreshHomeScores();

      result.fold(
        (f) => expect(f.message, 'Network error'),
        (_) => fail('expected Left'),
      );
    });

    test('r in [0.18, 0.28) yields empty summaries', () async {
      final repo = ScoresRepositoryImpl(
        local: localDataSource(),
        random: () => 0.2,
        refreshDelay: Duration.zero,
      );

      final refresh = await repo.refreshHomeScores();
      refresh.fold(
        (_) => fail('expected Right'),
        (list) => expect(list, isEmpty),
      );

      final home = await repo.getHomeScores();
      home.fold((_) {}, (list) => expect(list, isEmpty));
    });

    test('r >= 0.28 reloads and returns summaries', () async {
      final repo = ScoresRepositoryImpl(
        local: localDataSource(),
        random: () => 0.5,
        refreshDelay: Duration.zero,
      );

      final result = await repo.refreshHomeScores();

      result.fold(
        (_) => fail('expected Right'),
        (list) {
          expect(list, hasLength(1));
          expect(list.single.type, ScoreType.health);
          expect(list.single.currentScore, 73);
          expect(list.single.valueLabel, 'Good');
        },
      );
    });
  });

  group('refreshScoreDetail', () {
    test('r < 0.18 yields NetworkFailure', () async {
      final repo = ScoresRepositoryImpl(
        local: localDataSource(),
        random: () => 0.1,
        refreshDelay: Duration.zero,
      );

      final result = await repo.refreshScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
      );

      result.fold(
        (f) => expect(f.message, 'Network error'),
        (_) => fail('expected Left'),
      );
    });

    test(
      'r in [0.18, 0.28) yields detail with null values but preserved definitions',
      () async {
        final repo = ScoresRepositoryImpl(
          local: localDataSource(),
          random: () => 0.2,
          refreshDelay: Duration.zero,
        );

        final real = await repo.getScoreDetail(
          type: ScoreType.health,
          timeframe: Timeframe.d1,
        );
        final realDetail = real.fold(
          (_) => throw StateError('expected detail'),
          (d) => d,
        );

        final refreshed = await repo.refreshScoreDetail(
          type: ScoreType.health,
          timeframe: Timeframe.d1,
        );

        refreshed.fold(
          (_) => fail('expected Right'),
          (emptyDetail) {
            expect(emptyDetail.type, realDetail.type);
            expect(emptyDetail.timeframe, realDetail.timeframe);
            expect(emptyDetail.definitions, realDetail.definitions);
            expect(emptyDetail.insights, isEmpty);
            expect(
              emptyDetail.points.every((p) => p.value == null),
              isTrue,
            );
            for (final series in emptyDetail.metrics.values) {
              expect(series.every((m) => m.value == null), isTrue);
            }
          },
        );
      },
    );

    test('r >= 0.28 reloads and returns mapped detail', () async {
      final repo = ScoresRepositoryImpl(
        local: localDataSource(),
        random: () => 0.5,
        refreshDelay: Duration.zero,
      );

      final result = await repo.refreshScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
      );

      result.fold(
        (_) => fail('expected Right'),
        (detail) {
          expect(detail.type, ScoreType.health);
          expect(detail.timeframe, Timeframe.d1);
          expect(detail.points, isNotEmpty);
          expect(detail.definitions, isNotEmpty);
        },
      );
    });
  });
}
