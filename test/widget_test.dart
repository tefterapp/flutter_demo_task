import 'package:flutter/material.dart';
import 'package:flutter_demo_task/app/app.dart';
import 'package:flutter_demo_task/core/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    configureDependencies();
  });

  testWidgets('App shows scores home', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Score Detail Preview'), findsOneWidget);
  });
}
