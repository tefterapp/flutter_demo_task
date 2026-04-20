import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_demo_task/core/error/failure.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_summary.dart';
import 'package:flutter_demo_task/features/scores/domain/entities/score_type.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/get_score_detail.dart';
import 'package:flutter_demo_task/features/scores/domain/usecases/refresh_score_detail.dart';
import 'package:flutter_demo_task/features/scores/presentation/blocs/score_detail/score_detail_bloc.dart';
import 'package:flutter_demo_task/features/scores/presentation/blocs/score_detail/score_detail_event.dart';
import 'package:flutter_demo_task/features/scores/presentation/blocs/score_detail/score_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetScoreDetail extends Mock implements GetScoreDetail {}

class _MockRefreshScoreDetail extends Mock implements RefreshScoreDetail {}

ScoreDetail _detail(ScoreType type, {double? pointValue = 72}) {
  return ScoreDetail(
    type: type,
    timeframe: Timeframe.d1,
    points: [ScorePoint(date: DateTime(2026, 4, 16), value: pointValue)],
    metrics: const {},
    insights: const [],
    definitions: const [],
  );
}

void main() {
  late _MockGetScoreDetail get;
  late _MockRefreshScoreDetail refresh;

  const summary = ScoreSummary(
    type: ScoreType.readiness,
    currentScore: 70,
    valueLabel: 'Balanced',
  );

  const healthSummary = ScoreSummary(
    type: ScoreType.health,
    currentScore: 72,
    valueLabel: 'Good',
  );

  setUpAll(() {
    registerFallbackValue(ScoreType.health);
    registerFallbackValue(Timeframe.d1);
  });

  setUp(() {
    get = _MockGetScoreDetail();
    refresh = _MockRefreshScoreDetail();
    // Default stubs so any unstubbed call returns a sensible value rather
    // than null-crashing.
    when(
      () => get(
        type: any(named: 'type'),
        timeframe: any(named: 'timeframe'),
      ),
    ).thenAnswer((inv) async {
      final t = inv.namedArguments[#type] as ScoreType;
      return Right(_detail(t));
    });
    when(
      () => refresh(
        type: any(named: 'type'),
        timeframe: any(named: 'timeframe'),
      ),
    ).thenAnswer((inv) async {
      final t = inv.namedArguments[#type] as ScoreType;
      return Right(_detail(t));
    });
  });

  ScoreDetailBloc build() =>
      ScoreDetailBloc(getScoreDetail: get, refreshScoreDetail: refresh);

  group('started', () {
    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'emits loading then success for a non-health score',
      build: build,
      act: (bloc) => bloc.add(const ScoreDetailEvent.started(summary)),
      expect: () => [
        isA<ScoreDetailLoading>(),
        isA<ScoreDetailSuccess>()
            .having((s) => s.summary, 'summary', summary)
            .having((s) => s.timeframe, 'timeframe', Timeframe.d1)
            .having((s) => s.isEmpty, 'isEmpty', false)
            .having((s) => s.siblingDetails, 'siblingDetails', isEmpty),
      ],
      verify: (_) {
        verify(
          () => get(type: ScoreType.readiness, timeframe: Timeframe.d1),
        ).called(1);
        verifyNever(
          () => refresh(type: ScoreType.readiness, timeframe: Timeframe.d1),
        );
      },
    );

    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'emits loading then failure when initial get fails',
      build: () {
        when(
          () => get(type: ScoreType.readiness, timeframe: Timeframe.d1),
        ).thenAnswer(
          (_) async => const Left(NetworkFailure(message: 'offline')),
        );
        return build();
      },
      act: (bloc) => bloc.add(const ScoreDetailEvent.started(summary)),
      expect: () => [
        isA<ScoreDetailLoading>(),
        isA<ScoreDetailFailure>()
            .having((s) => s.failure.message, 'failure.message', 'offline'),
      ],
    );

    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'fetches sibling details for health and puts them on success',
      build: build,
      act: (bloc) => bloc.add(const ScoreDetailEvent.started(healthSummary)),
      expect: () => [
        isA<ScoreDetailLoading>(),
        isA<ScoreDetailSuccess>()
            .having((s) => s.summary, 'summary', healthSummary)
            .having((s) => s.siblingDetails, 'siblingDetails', hasLength(2)),
      ],
    );

    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'marks success as empty when every point value is null',
      build: () {
        when(
          () => get(type: ScoreType.readiness, timeframe: Timeframe.d1),
        ).thenAnswer(
          (_) async => Right(_detail(ScoreType.readiness, pointValue: null)),
        );
        return build();
      },
      act: (bloc) => bloc.add(const ScoreDetailEvent.started(summary)),
      expect: () => [
        isA<ScoreDetailLoading>(),
        isA<ScoreDetailSuccess>().having((s) => s.isEmpty, 'isEmpty', true),
      ],
    );
  });

  group('timeframeChanged', () {
    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'uses the read path (get) and switches timeframe',
      build: build,
      act: (bloc) async {
        bloc.add(const ScoreDetailEvent.started(summary));
        await Future<void>.delayed(Duration.zero);
        bloc.add(const ScoreDetailEvent.timeframeChanged(Timeframe.d7));
      },
      skip: 2,
      expect: () => [
        isA<ScoreDetailLoading>()
            .having((s) => s.timeframe, 'timeframe', Timeframe.d7),
        isA<ScoreDetailSuccess>()
            .having((s) => s.timeframe, 'timeframe', Timeframe.d7),
      ],
      verify: (_) {
        verify(
          () => get(type: ScoreType.readiness, timeframe: Timeframe.d7),
        ).called(1);
      },
    );
  });

  group('dateChanged', () {
    blocTest<ScoreDetailBloc, ScoreDetailState>(
      'applies past dates and preserves the state variant',
      build: build,
      act: (bloc) async {
        bloc.add(const ScoreDetailEvent.started(summary));
        await Future<void>.delayed(Duration.zero);
        bloc.add(ScoreDetailEvent.dateChanged(DateTime(2026, 4, 10)));
      },
      skip: 2,
      expect: () => [
        isA<ScoreDetailSuccess>()
            .having((s) => s.selectedDate, 'selectedDate', DateTime(2026, 4, 10)),
      ],
    );
  });

  group('waitForRefreshComplete', () {
    test('completes after a successful refresh round-trip', () async {
      final bloc = build()..add(const ScoreDetailEvent.started(summary));
      await Future<void>.delayed(Duration.zero);

      await bloc.waitForRefreshComplete();

      expect(bloc.state, isA<ScoreDetailSuccess>());
      await bloc.close();
    });
  });
}
