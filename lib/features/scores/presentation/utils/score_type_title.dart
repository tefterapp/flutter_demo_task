import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/score_type.dart';

String scoreTypeLocalizedTitle(AppLocalizations l10n, ScoreType type) {
  switch (type) {
    case ScoreType.health:
      return l10n.scoreHealth;
    case ScoreType.readiness:
      return l10n.scoreReadiness;
    case ScoreType.activity:
      return l10n.scoreActivity;
  }
}
