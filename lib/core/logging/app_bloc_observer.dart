import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_logger.dart';

/// Output shape:
/// ```
/// Bloc · ScoreDetailBloc received ScoreDetailStarted
/// Bloc · ScoreDetailBloc transitioned Loading → Success
/// ```
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.d(
      'Bloc · ${bloc.runtimeType} received ${event?.runtimeType ?? 'null'}',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.d(
      'Bloc · ${bloc.runtimeType} transitioned '
      '${change.currentState.runtimeType} → ${change.nextState.runtimeType}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.e(
      'Bloc · ${bloc.runtimeType} hit an unhandled error',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
