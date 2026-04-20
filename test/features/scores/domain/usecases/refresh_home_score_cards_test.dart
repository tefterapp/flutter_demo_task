import 'package:dartz/dartz.dart';
import 'package:flutter_demo_task/core/error/failure.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_summary.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_demo_task/features/scores/domain/repositories/scores_repository.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/refresh_home_score_cards.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepo extends Mock implements ScoresRepository {}

ScoreDetail _detail(ScoreType t) => ScoreDetail(
      type: t,
      timeframe: Timeframe.d1,
      points: const [],
      metrics: const {},
      insights: const [],
      definitions: const [],
    );

void main() {
  late _MockRepo repo;
  late RefreshHomeScoreCards useCase;

  setUpAll(() {
    registerFallbackValue(ScoreType.health);
    registerFallbackValue(Timeframe.d1);
  });

  setUp(() {
    repo = _MockRepo();
    useCase = RefreshHomeScoreCards(repo);
  });

  test('happy path returns all refreshed cards', () async {
    const summaries = [
      ScoreSummary(
        type: ScoreType.activity,
        currentScore: 64,
        valueLabel: 'Moderate',
      ),
    ];
    when(() => repo.refreshHomeScores())
        .thenAnswer((_) async => const Right(summaries));
    when(
      () => repo.refreshScoreDetail(
        type: ScoreType.activity,
        timeframe: Timeframe.d1,
      ),
    ).thenAnswer((_) async => Right(_detail(ScoreType.activity)));

    final result = await useCase();

    expect(result.isRight(), true);
    result.fold((_) => fail('expected Right'), (cards) {
      expect(cards, hasLength(1));
      expect(cards.single.summary.type, ScoreType.activity);
    });
  });

  test('returns Left when refreshHomeScores fails', () async {
    when(() => repo.refreshHomeScores())
        .thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase();

    expect(result.isLeft(), true);
  });

  test('returns Right empty when summaries empty', () async {
    when(() => repo.refreshHomeScores())
        .thenAnswer((_) async => const Right(<ScoreSummary>[]));

    final result = await useCase();

    expect(result.isRight(), true);
    result.fold((_) => fail('expected Right'), (cards) => expect(cards, isEmpty));
  });
}
