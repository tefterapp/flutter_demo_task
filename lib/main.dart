import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/di/di.dart';
import 'core/logging/app_bloc_observer.dart';
import 'core/logging/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  FlutterError.onError = (details) {
    AppLogger.e(
      'Flutter · uncaught framework error',
      error: details.exception,
      stackTrace: details.stack,
    );
    FlutterError.presentError(details);
  };
  AppLogger.i('App · starting up');
  configureDependencies();
  runApp(const App());
}
