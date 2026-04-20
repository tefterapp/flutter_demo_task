import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Score Detail Preview'**
  String get appTitle;

  /// No description provided for @scoreHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get scoreHealth;

  /// No description provided for @scoreReadiness.
  ///
  /// In en, this message translates to:
  /// **'Readiness'**
  String get scoreReadiness;

  /// No description provided for @scoreActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get scoreActivity;

  /// No description provided for @timeframe1d.
  ///
  /// In en, this message translates to:
  /// **'1D'**
  String get timeframe1d;

  /// No description provided for @timeframe7d.
  ///
  /// In en, this message translates to:
  /// **'7D'**
  String get timeframe7d;

  /// No description provided for @timeframe30d.
  ///
  /// In en, this message translates to:
  /// **'30D'**
  String get timeframe30d;

  /// No description provided for @timeframe1y.
  ///
  /// In en, this message translates to:
  /// **'1Y'**
  String get timeframe1y;

  /// No description provided for @sectionMetrics.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get sectionMetrics;

  /// No description provided for @sectionInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get sectionInsights;

  /// No description provided for @sectionInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get sectionInfo;

  /// No description provided for @sectionHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How It Works?'**
  String get sectionHowItWorks;

  /// No description provided for @howItWorksHealth.
  ///
  /// In en, this message translates to:
  /// **'Your Health Score brings rest and activity together into one number, showing how balanced your day is. It\'s the average of your Readiness and Activity scores.\n\nA score of 80 represents your personal baseline. This is the point where your daily metrics align with your 30-day averages.'**
  String get howItWorksHealth;

  /// No description provided for @howItWorksReadiness.
  ///
  /// In en, this message translates to:
  /// **'Your Readiness Score reflects how recovered you are based on sleep, resting heart rate, and heart rate variability.\n\nA score of 80 represents your personal baseline — a day when recovery metrics align with your 30-day averages.'**
  String get howItWorksReadiness;

  /// No description provided for @howItWorksActivity.
  ///
  /// In en, this message translates to:
  /// **'Your Activity Score measures how active you were based on steps, active calories, active points, and move hours.\n\nA score of 80 represents your personal baseline — a day when your movement meets your 30-day average.'**
  String get howItWorksActivity;

  /// No description provided for @scoreSuffix.
  ///
  /// In en, this message translates to:
  /// **' Score'**
  String get scoreSuffix;

  /// No description provided for @labelAvg.
  ///
  /// In en, this message translates to:
  /// **'Daily Avg.'**
  String get labelAvg;

  /// No description provided for @labelNoData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get labelNoData;

  /// No description provided for @labelRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get labelRetry;

  /// No description provided for @metricTitleSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get metricTitleSleep;

  /// No description provided for @metricTitleRestingHr.
  ///
  /// In en, this message translates to:
  /// **'Resting HR'**
  String get metricTitleRestingHr;

  /// No description provided for @metricTitleOvernightHrv.
  ///
  /// In en, this message translates to:
  /// **'Overnight HRV'**
  String get metricTitleOvernightHrv;

  /// No description provided for @metricTitleActivePoints.
  ///
  /// In en, this message translates to:
  /// **'Active points'**
  String get metricTitleActivePoints;

  /// No description provided for @metricTitleSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get metricTitleSteps;

  /// No description provided for @metricTitleActiveCalories.
  ///
  /// In en, this message translates to:
  /// **'Active calories'**
  String get metricTitleActiveCalories;

  /// No description provided for @metricTitleMoveHours.
  ///
  /// In en, this message translates to:
  /// **'Move hours'**
  String get metricTitleMoveHours;

  /// No description provided for @emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show'**
  String get emptyTitle;

  /// No description provided for @emptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap Retry to try again.'**
  String get emptyMessage;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap Retry to try again.'**
  String get errorMessage;

  /// No description provided for @periodDay.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get periodDay;

  /// No description provided for @periodWeek.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get periodMonth;

  /// No description provided for @periodYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get periodYear;

  /// No description provided for @insightsNoData.
  ///
  /// In en, this message translates to:
  /// **'No score recorded for this {period}.'**
  String insightsNoData(String period);

  /// No description provided for @insightsScoreValue.
  ///
  /// In en, this message translates to:
  /// **'Score of {value} on this {period}.'**
  String insightsScoreValue(String value, String period);

  /// No description provided for @insightsAverageValue.
  ///
  /// In en, this message translates to:
  /// **'Average of {value} pts across this {period}.'**
  String insightsAverageValue(String value, String period);

  /// No description provided for @insightsDeltaUp.
  ///
  /// In en, this message translates to:
  /// **'Up {delta} pts vs previous {period}.'**
  String insightsDeltaUp(String delta, String period);

  /// No description provided for @insightsDeltaDown.
  ///
  /// In en, this message translates to:
  /// **'Down {delta} pts vs previous {period}.'**
  String insightsDeltaDown(String delta, String period);

  /// No description provided for @insightsDeltaFlat.
  ///
  /// In en, this message translates to:
  /// **'Roughly unchanged from previous {period}.'**
  String insightsDeltaFlat(String period);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
