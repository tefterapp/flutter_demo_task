import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/scores_local_datasource.dart';
import 'data/repositories/scores_repository_impl.dart';
import 'domain/repositories/scores_repository.dart';
import 'domain/usecases/get_home_score_cards.dart';
import 'domain/usecases/get_score_detail.dart';
import 'domain/usecases/refresh_home_score_cards.dart';
import 'domain/usecases/refresh_score_detail.dart';
import 'presentation/blocs/score_detail/score_detail_bloc.dart';
import 'presentation/blocs/scores_home/scores_home_cubit.dart';

void configureScoresDependencies(GetIt getIt) {
  getIt
    ..registerLazySingleton<ScoresLocalDataSource>(
      () => ScoresLocalDataSourceImpl(bundle: rootBundle),
    )
    ..registerLazySingleton<ScoresRepository>(
      () => ScoresRepositoryImpl(local: getIt<ScoresLocalDataSource>()),
    )
    ..registerLazySingleton(() => GetScoreDetail(getIt<ScoresRepository>()))
    ..registerLazySingleton(
      () => RefreshScoreDetail(getIt<ScoresRepository>()),
    )
    ..registerLazySingleton(
      () => GetHomeScoreCards(getIt<ScoresRepository>()),
    )
    ..registerLazySingleton(
      () => RefreshHomeScoreCards(getIt<ScoresRepository>()),
    )
    ..registerFactory(
      () => ScoresHomeCubit(
        getHomeScoreCards: getIt<GetHomeScoreCards>(),
        refreshHomeScoreCards: getIt<RefreshHomeScoreCards>(),
      ),
    )
    ..registerFactory<ScoreDetailBloc>(
      () => ScoreDetailBloc(
        getScoreDetail: getIt<GetScoreDetail>(),
        refreshScoreDetail: getIt<RefreshScoreDetail>(),
      ),
    );
}
