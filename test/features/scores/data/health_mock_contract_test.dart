import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Guard-rail test: ensures the bundled mock `scores.json` exposes the full
/// Health metric contract (Activity ∪ Readiness tiles) on the single shared
/// daily series.
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

  test('Health exposes Activity + Readiness metrics on the shared series', () {
    final root = loadRoot();
    final scores = (root['scores'] as List).cast<Map<String, dynamic>>();
    final health = scores.firstWhere((s) => s['type'] == 'health');

    final metrics = (health['metrics'] as Map<String, dynamic>).keys.toSet();
    expect(
      metrics,
      containsAll(expectedHealthKeys),
      reason: 'Health metrics is missing keys',
    );

    final definitions = (health['definitions'] as List)
        .cast<Map<String, dynamic>>();
    final defKeys = definitions.map((d) => d['key'] as String).toSet();
    expect(
      defKeys,
      containsAll(expectedHealthKeys),
      reason: 'Health definitions is missing keys',
    );
  });
}
