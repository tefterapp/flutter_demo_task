import 'package:flutter/material.dart';

import '../core/extensions/build_context_x.dart';
import '../core/ui/app_theme.dart';
import '../features/scores/presentation/pages/scores_home/scores_home_page.dart';
import '../l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (ctx) => ctx.l10n.appTitle,
      home: const ScoresHomePage(),
    );
  }
}
