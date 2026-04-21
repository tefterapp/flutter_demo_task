import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_task/features/scores/data/datasources/scores_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

/// Minimal [AssetBundle] that serves string assets from a map (no real assets).
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

  final sampleJson = jsonEncode({
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
        'insights': ['ok'],
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

  test('loadScores parses JSON from injected AssetBundle', () async {
    final bundle = _MapAssetBundle({assetPath: sampleJson});
    final ds = ScoresLocalDataSourceImpl(bundle: bundle);

    final result = await ds.loadScores();

    result.fold(
      (_) => fail('expected Right'),
      (dto) {
        expect(dto.scores, hasLength(1));
        final s = dto.scores.single;
        expect(s.type, 'health');
        expect(s.currentScore, 72.5);
        expect(s.valueLabel, 'Good');
        expect(s.points, hasLength(1));
        expect(s.points.single.date, '2026-04-15');
        expect(s.points.single.value, 70.0);
        expect(s.metrics['steps'], hasLength(1));
        expect(s.insights, ['ok']);
        expect(s.definitions.single.key, 'steps');
      },
    );
  });

  test('loadScores returns ParsingFailure when root is not an object', () async {
    final bundle = _MapAssetBundle({assetPath: '42'});
    final ds = ScoresLocalDataSourceImpl(bundle: bundle);

    final result = await ds.loadScores();

    result.fold(
      (f) => expect(f.message, contains('Root JSON must be an object')),
      (_) => fail('expected Left'),
    );
  });
}
