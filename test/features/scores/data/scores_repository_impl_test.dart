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

  final payloadJson = jsonEncode({
    'scores': [
      {
        'type': 'health',
        'currentScore': 72.5,
        'valueLabel': 'Good',
        'points': [
          {'date': '2026-04-15', 'value': 70.0},
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
    ],
  });

  ScoresLocalDataSourceImpl localDataSource() {
    final bundle = _MapAssetBundle({assetPath: payloadJson});
    return ScoresLocalDataSourceImpl(bundle: bundle);
  }

  ScoresRepositoryImpl repository() => ScoresRepositoryImpl(
    local: localDataSource(),
    simulatedDelay: Duration.zero,
  );

  group('getHomeScores', () {
    test('maps payload to summaries', () async {
      final result = await repository().getHomeScores();

      result.fold((_) => fail('expected Right'), (list) {
        expect(list, hasLength(1));
        expect(list.single.type, ScoreType.health);
        expect(list.single.currentScore, 73);
        expect(list.single.valueLabel, 'Good');
      });
    });
  });

  group('refreshHomeScores', () {
    test('invalidates cache and returns mapped summaries', () async {
      final repo = repository();

      // warm the cache
      await repo.getHomeScores();

      final result = await repo.refreshHomeScores();

      result.fold((_) => fail('expected Right'), (list) {
        expect(list, hasLength(1));
        expect(list.single.type, ScoreType.health);
      });
    });
  });

  group('refreshScoreDetail', () {
    test('invalidates cache and returns mapped detail', () async {
      final repo = repository();

      await repo.getScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
      );

      final result = await repo.refreshScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
      );

      result.fold((_) => fail('expected Right'), (detail) {
        expect(detail.type, ScoreType.health);
        expect(detail.timeframe, Timeframe.d1);
        expect(detail.points, isNotEmpty);
        expect(detail.definitions, isNotEmpty);
      });
    });
  });
}
