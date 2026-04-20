import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_demo_task/core/error/failure.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/home_score_card.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_summary.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/get_home_score_cards.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/refresh_home_score_cards.dart';
import 'package:flutter_demo_task/features/scores/presentation/blocs/scores_home/scores_home_cubit.dart';
import 'package:flutter_demo_task/features/scores/presentation/blocs/scores_home/scores_home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockGet extends Mock implements GetHomeScoreCards {}

class _MockRefresh extends Mock implements RefreshHomeScoreCards {}

ScoreDetail _detail(ScoreType t) => ScoreDetail(
      type: t,
      timeframe: Timeframe.d1,
      points: const [],
      metrics: const {},
      insights: const [],
      definitions: const [],
    );

void main() {
  final sampleCards = [
    HomeScoreCard(
      summary: const ScoreSummary(
        type: ScoreType.health,
        currentScore: 72,
        valueLabel: 'Good',
      ),
      d1Detail: _detail(ScoreType.health),
    ),
  ];

  late _MockGet getCards;
  late _MockRefresh refreshCards;

  setUp(() {
    getCards = _MockGet();
    refreshCards = _MockRefresh();
  });

  ScoresHomeCubit buildCubit() => ScoresHomeCubit(
        getHomeScoreCards: getCards,
        refreshHomeScoreCards: refreshCards,
      );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'load emits loading then success with cards',
    build: buildCubit,
    act: (cubit) => cubit.load(),
    setUp: () {
      when(() => getCards()).thenAnswer((_) async => Right(sampleCards));
    },
    expect: () => [
      const ScoresHomeState.loading(),
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          success: (cards) =>
              cards.length == 1 &&
              cards.single.summary.type == ScoreType.health,
          orElse: () => false,
        ),
      ),
    ],
  );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'load emits loading then empty when empty',
    build: buildCubit,
    act: (cubit) => cubit.load(),
    setUp: () {
      when(() => getCards())
          .thenAnswer((_) async => const Right(<HomeScoreCard>[]));
    },
    expect: () => [
      const ScoresHomeState.loading(),
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(empty: () => true, orElse: () => false),
      ),
    ],
  );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'load emits loading then failure',
    build: buildCubit,
    act: (cubit) => cubit.load(),
    setUp: () {
      when(() => getCards()).thenAnswer(
        (_) async => const Left(NetworkFailure(message: 'offline')),
      );
    },
    expect: () => [
      const ScoresHomeState.loading(),
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          failure: (f) => f.message == 'offline',
          orElse: () => false,
        ),
      ),
    ],
  );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'refresh emits success',
    build: buildCubit,
    act: (cubit) => cubit.refresh(),
    setUp: () {
      when(() => refreshCards()).thenAnswer((_) async => Right(sampleCards));
    },
    expect: () => [
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          success: (cards) => cards.length == 1,
          orElse: () => false,
        ),
      ),
    ],
  );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'refresh emits failure',
    build: buildCubit,
    act: (cubit) => cubit.refresh(),
    setUp: () {
      when(() => refreshCards()).thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'nope')),
      );
    },
    expect: () => [
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          failure: (f) => f.message == 'nope',
          orElse: () => false,
        ),
      ),
    ],
  );

  blocTest<ScoresHomeCubit, ScoresHomeState>(
    'retry always re-hits refresh and keeps working on repeated taps',
    build: buildCubit,
    act: (cubit) async {
      await cubit.retry();
      await cubit.retry();
    },
    setUp: () {
      final outcomes = <Either<Failure, List<HomeScoreCard>>>[
        const Left(NetworkFailure(message: 'first')),
        Right(sampleCards),
      ];
      when(() => refreshCards()).thenAnswer((_) async => outcomes.removeAt(0));
    },
    expect: () => [
      const ScoresHomeState.loading(),
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          failure: (f) => f.message == 'first',
          orElse: () => false,
        ),
      ),
      const ScoresHomeState.loading(),
      predicate<ScoresHomeState>(
        (s) => s.maybeWhen(
          success: (cards) => cards.length == 1,
          orElse: () => false,
        ),
      ),
    ],
    verify: (_) {
      verify(() => refreshCards()).called(2);
    },
  );
}
