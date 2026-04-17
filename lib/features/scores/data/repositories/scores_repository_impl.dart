import 'dart:math';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/logging/app_logger.dart';
import '../../domain/entities/score_detail.dart';
import '../../domain/entities/score_summary.dart';
import '../../domain/entities/score_type.dart';
import '../../domain/repositories/scores_repository.dart';
import '../datasources/scores_local_datasource.dart';
import '../models/scores_payload_dto.dart';

typedef RandomProvider = double Function();

final class ScoresRepositoryImpl implements ScoresRepository {
  ScoresRepositoryImpl({
    required ScoresLocalDataSource local,
    RandomProvider? random,
    this.refreshDelay = const Duration(milliseconds: 500),
  })  : _local = local,
        _random = random ?? _defaultRandomFrom(Random());

  final ScoresLocalDataSource _local;
  final RandomProvider _random;
  final Duration refreshDelay;

  ScoresPayloadDto? _cache;
  bool _forcedHomeEmpty = false;
  final Map<({ScoreType type, Timeframe timeframe}), ScoreDetail>
      _forcedEmptyDetails = {};

  static RandomProvider _defaultRandomFrom(Random rng) => rng.nextDouble;

  Future<Either<Failure, ScoresPayloadDto>> _ensureCache() async {
    final cached = _cache;
    if (cached != null) {
      return Right(cached);
    }
    final result = await _local.loadScores();
    return result.fold(Left.new, (dto) {
      _cache = dto;
      return Right(dto);
    });
  }

  @override
  Future<Either<Failure, List<ScoreSummary>>> getHomeScores() async {
    if (_forcedHomeEmpty) {
      return const Right(<ScoreSummary>[]);
    }
    final ensured = await _ensureCache();
    return ensured.fold(Left.new, _mapSummaries);
  }

  Either<Failure, List<ScoreSummary>> _mapSummaries(ScoresPayloadDto dto) {
    final summaries = <ScoreSummary>[];
    for (final s in dto.scores) {
      final type = _scoreTypeFromJsonKey(s.type);
      if (type == null) {
        return Left(
          ParsingFailure(message: 'Unknown score type: ${s.type}'),
        );
      }
      summaries.add(
        ScoreSummary(
          type: type,
          currentScore: s.currentScore.round(),
          valueLabel: s.valueLabel,
        ),
      );
    }
    return Right(summaries);
  }

  ScoreType? _scoreTypeFromJsonKey(String key) {
    for (final t in ScoreType.values) {
      if (t.jsonKey == key) {
        return t;
      }
    }
    return null;
  }

  @override
  Future<Either<Failure, ScoreDetail>> getScoreDetail({
    required ScoreType type,
    required Timeframe timeframe,
  }) async {
    final forced = _forcedEmptyDetails[(type: type, timeframe: timeframe)];
    if (forced != null) {
      return Right(forced);
    }
    final ensured = await _ensureCache();
    return ensured.fold(
      Left.new,
      (dto) => _mapScoreDetail(dto, type, timeframe),
    );
  }

  Either<Failure, ScoreDetail> _mapScoreDetail(
    ScoresPayloadDto dto,
    ScoreType type,
    Timeframe timeframe,
  ) {
    ScoreDto? match;
    for (final s in dto.scores) {
      if (s.type == type.jsonKey) {
        match = s;
        break;
      }
    }
    if (match == null) {
      return Left(
        ParsingFailure(message: 'Missing score for type: ${type.jsonKey}'),
      );
    }
    final tfDto = match.timeframes[timeframe.jsonKey];
    if (tfDto == null) {
      return Left(
        ParsingFailure(
          message:
              'Missing timeframe ${timeframe.jsonKey} for type ${type.jsonKey}',
        ),
      );
    }
    return _mapTimeframeDto(type, timeframe, tfDto);
  }

  Either<Failure, ScoreDetail> _mapTimeframeDto(
    ScoreType type,
    Timeframe timeframe,
    TimeframeDto tf,
  ) {
    final points = <ScorePoint>[];
    for (final p in tf.points) {
      final parsed = DateTime.tryParse(p.date);
      if (parsed == null) {
        return Left(
          ParsingFailure(message: 'Invalid date on main series: ${p.date}'),
        );
      }
      points.add(ScorePoint(date: parsed, value: p.value));
    }

    final metrics = <String, List<MetricPoint>>{};
    for (final entry in tf.metrics.entries) {
      final list = <MetricPoint>[];
      for (final p in entry.value) {
        final parsed = DateTime.tryParse(p.date);
        if (parsed == null) {
          return Left(
            ParsingFailure(
              message: 'Invalid date on metric ${entry.key}: ${p.date}',
            ),
          );
        }
        list.add(MetricPoint(date: parsed, value: p.value));
      }
      metrics[entry.key] = list;
    }

    final definitions = tf.definitions
        .map(
          (d) => MetricDefinition(
            key: d.key,
            title: d.title,
            description: d.description,
          ),
        )
        .toList();

    return Right(
      ScoreDetail(
        type: type,
        timeframe: timeframe,
        points: points,
        metrics: metrics,
        insights: List<String>.from(tf.insights),
        definitions: definitions,
      ),
    );
  }

  ScoreDetail _emptyDetailFrom(ScoreDetail real) {
    return ScoreDetail(
      type: real.type,
      timeframe: real.timeframe,
      points: real.points.map((p) => ScorePoint(date: p.date)).toList(),
      metrics: real.metrics.map(
        (k, v) => MapEntry(
          k,
          v.map((m) => MetricPoint(date: m.date)).toList(),
        ),
      ),
      insights: const [],
      definitions: real.definitions,
    );
  }

  @override
  Future<Either<Failure, List<ScoreSummary>>> refreshHomeScores() async {
    AppLogger.d('Scores · refreshing home list');
    await Future<void>.delayed(refreshDelay);
    final r = _random();
    if (r < 0.18) {
      AppLogger.w('Scores · home refresh failed (simulated network error)');
      return const Left(NetworkFailure());
    }
    if (r < 0.28) {
      _forcedHomeEmpty = true;
      AppLogger.i('Scores · home refresh returned empty (simulated)');
      return const Right(<ScoreSummary>[]);
    }
    _forcedHomeEmpty = false;
    _cache = null;
    AppLogger.d('Scores · home refresh succeeded');
    return getHomeScores();
  }

  @override
  Future<Either<Failure, ScoreDetail>> refreshScoreDetail({
    required ScoreType type,
    required Timeframe timeframe,
  }) async {
    final tag = '${type.name}/${timeframe.name}';
    AppLogger.d('Scores · refreshing detail for $tag');
    await Future<void>.delayed(refreshDelay);
    final r = _random();
    if (r < 0.18) {
      AppLogger.w('Scores · detail refresh failed for $tag (simulated)');
      return const Left(NetworkFailure());
    }
    if (r < 0.28) {
      final real = await getScoreDetail(type: type, timeframe: timeframe);
      return real.fold(Left.new, (detail) {
        final empty = _emptyDetailFrom(detail);
        _forcedEmptyDetails[(type: type, timeframe: timeframe)] = empty;
        AppLogger.i('Scores · detail refresh returned empty for $tag');
        return Right(empty);
      });
    }
    _forcedEmptyDetails.remove((type: type, timeframe: timeframe));
    _cache = null;
    AppLogger.d('Scores · detail refresh succeeded for $tag');
    return getScoreDetail(type: type, timeframe: timeframe);
  }
}
