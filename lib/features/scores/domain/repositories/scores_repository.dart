import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/score_detail.dart';
import '../entities/score_summary.dart';
import '../entities/score_type.dart';

abstract class ScoresRepository {
  Future<Either<Failure, List<ScoreSummary>>> getHomeScores();

  Future<Either<Failure, ScoreDetail>> getScoreDetail({
    required ScoreType type,
    required Timeframe timeframe,
  });

  Future<Either<Failure, List<ScoreSummary>>> refreshHomeScores();

  Future<Either<Failure, ScoreDetail>> refreshScoreDetail({
    required ScoreType type,
    required Timeframe timeframe,
  });
}
