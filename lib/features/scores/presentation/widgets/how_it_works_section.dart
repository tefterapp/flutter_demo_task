import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/score_type.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({required this.type, super.key});

  final ScoreType type;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.sectionHowItWorks,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _textFor(l10n, type),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            height: 1.45,
          ),
        ),
      ],
    );
  }

  static String _textFor(AppLocalizations l10n, ScoreType type) {
    switch (type) {
      case ScoreType.health:
        return l10n.howItWorksHealth;
      case ScoreType.readiness:
        return l10n.howItWorksReadiness;
      case ScoreType.activity:
        return l10n.howItWorksActivity;
    }
  }
}
