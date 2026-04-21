import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/logging/app_logger.dart';
import '../../domain/entities/score_detail.dart';
import '../../domain/entities/score_summary.dart';
import '../../domain/entities/score_type.dart';
import '../../domain/repositories/scores_repository.dart';
import '../datasources/scores_local_datasource.dart';
import '../models/score_dto.dart';
import '../models/scores_payload_dto.dart';

final class ScoresRepositoryImpl implements ScoresRepository {
  ScoresRepositoryImpl({
    required ScoresLocalDataSource local,
    this.simulatedDelay = const Duration(milliseconds: 500),
  }) : _local = local;

  final ScoresLocalDataSource _local;
  final Duration simulatedDelay;

  ScoresPayloadDto? _cache;

  Future<Either<Failure, ScoresPayloadDto>> _ensureCache() async {
    final cached = _cache;
    if (cached != null) {
      return Right(cached);
    }
    await Future<void>.delayed(simulatedDelay);
    final result = await _local.loadScores();
    return result.fold(Left.new, (scoresPayloadDto) {
      _cache = scoresPayloadDto;
      return Right(scoresPayloadDto);
    });
  }

  @override
  Future<Either<Failure, List<ScoreSummary>>> getHomeScores() async {
    final ensured = await _ensureCache();
    return ensured.fold(Left.new, _mapSummaries);
  }

  Either<Failure, List<ScoreSummary>> _mapSummaries(
    ScoresPayloadDto scoresPayloadDto,
  ) {
    final summaries = <ScoreSummary>[];
    for (final s in scoresPayloadDto.scores) {
      final type = _scoreTypeFromJsonKey(s.type);
      if (type == null) {
        return Left(ParsingFailure(message: 'Unknown score type: ${s.type}'));
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
    final ensured = await _ensureCache();
    return ensured.fold(
      Left.new,
      (scoresPayloadDto) => _mapScoreDetail(scoresPayloadDto, type, timeframe),
    );
  }

  /// The mock exposes a single daily series per score; the timeframe argument
  /// is forwarded as metadata so the presentation layer can bucket the same
  /// data into week/month/year views without the JSON duplicating it.
  Either<Failure, ScoreDetail> _mapScoreDetail(
    ScoresPayloadDto scoresPayloadDto,
    ScoreType type,
    Timeframe timeframe,
  ) {
    ScoreDto? match;
    for (final s in scoresPayloadDto.scores) {
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

    final points = <ScorePoint>[];
    for (final p in match.points) {
      final parsed = DateTime.tryParse(p.date);
      if (parsed == null) {
        return Left(
          ParsingFailure(message: 'Invalid date on main series: ${p.date}'),
        );
      }
      points.add(ScorePoint(date: parsed, value: p.value));
    }

    final metrics = <String, List<MetricPoint>>{};
    for (final entry in match.metrics.entries) {
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

    final definitions = match.definitions
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
        insights: List<String>.from(match.insights),
        definitions: definitions,
      ),
    );
  }

  @override
  Future<Either<Failure, List<ScoreSummary>>> refreshHomeScores() async {
    AppLogger.d('Scores · refreshing home list');
    _cache = null;
    final result = await getHomeScores();
    AppLogger.d('Scores · home refresh succeeded');
    return result;
  }

  @override
  Future<Either<Failure, ScoreDetail>> refreshScoreDetail({
    required ScoreType type,
    required Timeframe timeframe,
  }) async {
    final tag = '${type.name}/${timeframe.name}';
    AppLogger.d('Scores · refreshing detail for $tag');
    _cache = null;
    final result = await getScoreDetail(type: type, timeframe: timeframe);
    AppLogger.d('Scores · detail refresh succeeded for $tag');
    return result;
  }
}
