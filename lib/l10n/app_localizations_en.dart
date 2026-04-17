// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Score Detail Preview';

  @override
  String get scoreHealth => 'Health';

  @override
  String get scoreReadiness => 'Readiness';

  @override
  String get scoreActivity => 'Activity';

  @override
  String get timeframe1d => '1D';

  @override
  String get timeframe7d => '7D';

  @override
  String get timeframe30d => '30D';

  @override
  String get timeframe1y => '1Y';

  @override
  String get sectionMetrics => 'Metrics';

  @override
  String get sectionInsights => 'Insights';

  @override
  String get sectionInfo => 'Info';

  @override
  String get sectionHowItWorks => 'How It Works?';

  @override
  String get howItWorksHealth =>
      'Your Health Score brings rest and activity together into one number, showing how balanced your day is. It\'s the average of your Readiness and Activity scores.\n\nA score of 80 represents your personal baseline. This is the point where your daily metrics align with your 30-day averages.';

  @override
  String get howItWorksReadiness =>
      'Your Readiness Score reflects how recovered you are based on sleep, resting heart rate, and heart rate variability.\n\nA score of 80 represents your personal baseline — a day when recovery metrics align with your 30-day averages.';

  @override
  String get howItWorksActivity =>
      'Your Activity Score measures how active you were based on steps, active calories, active points, and move hours.\n\nA score of 80 represents your personal baseline — a day when your movement meets your 30-day average.';

  @override
  String get scoreSuffix => ' Score';

  @override
  String get labelAvg => 'Daily Avg.';

  @override
  String get labelNoData => 'No data';

  @override
  String get labelRetry => 'Retry';

  @override
  String get emptyTitle => 'Nothing to show';

  @override
  String get emptyMessage => 'Tap Retry to try again.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorMessage => 'Tap Retry to try again.';

  @override
  String get periodDay => 'day';

  @override
  String get periodWeek => 'week';

  @override
  String get periodMonth => 'month';

  @override
  String get periodYear => 'year';

  @override
  String insightsNoData(String period) {
    return 'No score recorded for this $period.';
  }

  @override
  String insightsScoreValue(String value, String period) {
    return 'Score of $value on this $period.';
  }

  @override
  String insightsAverageValue(String value, String period) {
    return 'Average of $value pts across this $period.';
  }

  @override
  String insightsDeltaUp(String delta, String period) {
    return 'Up $delta pts vs previous $period.';
  }

  @override
  String insightsDeltaDown(String delta, String period) {
    return 'Down $delta pts vs previous $period.';
  }

  @override
  String insightsDeltaFlat(String period) {
    return 'Roughly unchanged from previous $period.';
  }
}
