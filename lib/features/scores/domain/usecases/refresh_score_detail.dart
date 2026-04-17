import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/score_detail.dart';
import '../entities/score_type.dart';
import '../repositories/scores_repository.dart';

class RefreshScoreDetail {
  const RefreshScoreDetail(this._repository);

  final ScoresRepository _repository;

  Future<Either<Failure, ScoreDetail>> call({
    required ScoreType type,
    required Timeframe timeframe,
  }) =>
      _repository.refreshScoreDetail(type: type, timeframe: timeframe);
}
