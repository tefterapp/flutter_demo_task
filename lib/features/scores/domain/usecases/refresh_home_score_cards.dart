import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/home_score_card.dart';
import '../entities/score_detail.dart';
import '../entities/score_summary.dart';
import '../entities/score_type.dart';
import '../repositories/scores_repository.dart';

class RefreshHomeScoreCards {
  const RefreshHomeScoreCards(this._repository);

  final ScoresRepository _repository;

  Future<Either<Failure, List<HomeScoreCard>>> call() async {
    final summariesEither = await _repository.refreshHomeScores();
    return summariesEither.fold(
      (failure) async => Left<Failure, List<HomeScoreCard>>(failure),
      _refreshDetails,
    );
  }

  Future<Either<Failure, List<HomeScoreCard>>> _refreshDetails(
    List<ScoreSummary> summaries,
  ) async {
    if (summaries.isEmpty) {
      return const Right(<HomeScoreCard>[]);
    }
    final detailResults = await Future.wait(
      summaries.map(
        (s) => _repository.refreshScoreDetail(
          type: s.type,
          timeframe: Timeframe.d1,
        ),
      ),
    );

    final cards = <HomeScoreCard>[];
    for (var i = 0; i < summaries.length; i++) {
      final either = detailResults[i];
      final detail = either.fold<ScoreDetail?>((_) => null, (d) => d);
      if (detail == null) {
        return either.fold(
          Left<Failure, List<HomeScoreCard>>.new,
          (_) => throw StateError('unreachable'),
        );
      }
      cards.add(HomeScoreCard(summary: summaries[i], d1Detail: detail));
    }
    return Right(cards);
  }
}
