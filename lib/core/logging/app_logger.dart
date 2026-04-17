import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Message convention: short, present-tense, sentence-case.
/// Prefer `'Home · loading scores'` over `'[ScoresHomeCubit] load: start'`.
abstract final class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: kReleaseMode ? Level.warning : Level.debug,
  );

  static void t(String message) => _logger.t(message);

  static void d(String message) => _logger.d(message);

  static void i(String message) => _logger.i(message);

  static void w(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  static void e(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}
