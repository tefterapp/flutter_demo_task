import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;

  AppLocalizations get l10n => AppLocalizations.of(this);

  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
}
