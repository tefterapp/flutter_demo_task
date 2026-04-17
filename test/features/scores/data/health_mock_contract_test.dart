import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Guard-rail test: ensures the bundled mock `scores.json` exposes the full
/// Health metric contract (Activity ∪ Readiness tiles) for every timeframe.
void main() {
  const expectedHealthKeys = {
    'activePoints',
    'steps',
    'activeCalories',
    'moveHours',
    'sleep',
    'restingHr',
    'hrv',
  };

  Map<String, dynamic> loadRoot() {
    final file = File('assets/mock/scores.json');
    expect(file.existsSync(), isTrue, reason: 'mock scores.json missing');
    return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  }

  test('Health exposes Activity + Readiness metrics across timeframes', () {
    final root = loadRoot();
    final scores = (root['scores'] as List).cast<Map<String, dynamic>>();
    final health = scores.firstWhere((s) => s['type'] == 'health');
    final timeframes = health['timeframes'] as Map<String, dynamic>;

    for (final tfKey in const ['d1', 'd7', 'd30', 'y1']) {
      final tf = timeframes[tfKey] as Map<String, dynamic>;
      final metrics = (tf['metrics'] as Map<String, dynamic>).keys.toSet();
      expect(
        metrics,
        containsAll(expectedHealthKeys),
        reason: 'Health.$tfKey.metrics is missing keys',
      );

      final definitions =
          (tf['definitions'] as List).cast<Map<String, dynamic>>();
      final defKeys = definitions.map((d) => d['key'] as String).toSet();
      expect(
        defKeys,
        containsAll(expectedHealthKeys),
        reason: 'Health.$tfKey.definitions is missing keys',
      );
    }
  });
}
