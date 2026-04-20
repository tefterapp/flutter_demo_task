import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/score_detail.dart';
import '../../domain/entities/score_type.dart';
import 'metric_math.dart';

List<String> buildDynamicInsights({
  required ScoreDetail detail,
  required Timeframe timeframe,
  required DateTime anchorDate,
  required AppLocalizations l10n,
}) {
  final period = _periodLabel(timeframe, l10n);

  final curr = scoreValueForTimeframe(
    points: detail.points,
    timeframe: timeframe,
    anchorDate: anchorDate,
  );
  if (curr == null) {
    return [l10n.insightsNoData(period)];
  }

  final prev = scoreValueForTimeframe(
    points: detail.points,
    timeframe: timeframe,
    anchorDate: _previousAnchor(timeframe, anchorDate),
  );

  final headline = timeframe == Timeframe.d1
      ? l10n.insightsScoreValue(_fmt(curr), period)
      : l10n.insightsAverageValue(_fmt(curr), period);

  return [headline, if (prev != null) _deltaLine(curr - prev, period, l10n)];
}

String _periodLabel(Timeframe tf, AppLocalizations l10n) {
  switch (tf) {
    case Timeframe.d1:
      return l10n.periodDay;
    case Timeframe.d7:
      return l10n.periodWeek;
    case Timeframe.d30:
      return l10n.periodMonth;
    case Timeframe.y1:
      return l10n.periodYear;
  }
}

String _deltaLine(double delta, String period, AppLocalizations l10n) {
  final rounded = delta.round();
  if (rounded == 0) {
    return l10n.insightsDeltaFlat(period);
  }
  final magnitude = rounded.abs().toString();
  return rounded > 0
      ? l10n.insightsDeltaUp(magnitude, period)
      : l10n.insightsDeltaDown(magnitude, period);
}

String _fmt(double v) => v.round().toString();

DateTime _previousAnchor(Timeframe tf, DateTime anchor) {
  switch (tf) {
    case Timeframe.d1:
      return anchor.subtract(const Duration(days: 1));
    case Timeframe.d7:
      return anchor.subtract(const Duration(days: 7));
    case Timeframe.d30:
      return DateTime(anchor.year, anchor.month - 1);
    case Timeframe.y1:
      return DateTime(anchor.year - 1);
  }
}
