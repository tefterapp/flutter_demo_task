import 'package:get_it/get_it.dart';

import '../../features/scores/scores_injection.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  configureScoresDependencies(getIt);
}
