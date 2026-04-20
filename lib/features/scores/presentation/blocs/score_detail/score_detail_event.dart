import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';

part 'score_detail_event.freezed.dart';

@freezed
sealed class ScoreDetailEvent with _$ScoreDetailEvent {
  const factory ScoreDetailEvent.started(ScoreSummary summary) =
      ScoreDetailStarted;
  const factory ScoreDetailEvent.refreshed() = ScoreDetailRefreshed;
  const factory ScoreDetailEvent.timeframeChanged(Timeframe timeframe) =
      ScoreDetailTimeframeChanged;
  const factory ScoreDetailEvent.dateChanged(DateTime date) =
      ScoreDetailDateChanged;
}
