import 'package:dartz/dartz.dart';
import 'package:flutter_demo_task/core/error/failure.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_summary.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_demo_task/features/scores/domain/repositories/scores_repository.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/get_home_score_cards.dart';
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
  late GetHomeScoreCards useCase;

  setUpAll(() {
    registerFallbackValue(ScoreType.health);
    registerFallbackValue(Timeframe.d1);
  });

  setUp(() {
    repo = _MockRepo();
    useCase = GetHomeScoreCards(repo);
  });

  test('returns Right with all cards on happy path', () async {
    const summaries = [
      ScoreSummary(
        type: ScoreType.health,
        currentScore: 72,
        valueLabel: 'Good',
      ),
      ScoreSummary(
        type: ScoreType.readiness,
        currentScore: 81,
        valueLabel: 'High',
      ),
    ];
    when(() => repo.getHomeScores())
        .thenAnswer((_) async => const Right(summaries));
    when(
      () => repo.getScoreDetail(
        type: ScoreType.health,
        timeframe: Timeframe.d1,
      ),
    ).thenAnswer((_) async => Right(_detail(ScoreType.health)));
    when(
      () => repo.getScoreDetail(
        type: ScoreType.readiness,
        timeframe: Timeframe.d1,
      ),
    ).thenAnswer((_) async => Right(_detail(ScoreType.readiness)));

    final result = await useCase();

    expect(result.isRight(), true);
    result.fold((_) => fail('expected Right'), (cards) {
      expect(cards, hasLength(2));
      expect(cards[0].summary.type, ScoreType.health);
      expect(cards[1].summary.type, ScoreType.readiness);
    });
  });

  test('returns Left when summaries fail', () async {
    when(() => repo.getHomeScores())
        .thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase();

    expect(result.isLeft(), true);
  });

  test('returns Left when any detail fails', () async {
    const summaries = [
      ScoreSummary(
        type: ScoreType.health,
        currentScore: 72,
        valueLabel: 'Good',
      ),
    ];
    when(() => repo.getHomeScores())
        .thenAnswer((_) async => const Right(summaries));
    when(
      () => repo.getScoreDetail(
        type: any(named: 'type'),
        timeframe: any(named: 'timeframe'),
      ),
    ).thenAnswer((_) async => const Left(UnknownFailure()));

    final result = await useCase();

    expect(result.isLeft(), true);
  });

  test('returns Right with empty list when summaries empty', () async {
    when(() => repo.getHomeScores())
        .thenAnswer((_) async => const Right(<ScoreSummary>[]));

    final result = await useCase();

    expect(result.isRight(), true);
    result.fold((_) => fail('expected Right'), (cards) {
      expect(cards, isEmpty);
    });
  });
}
