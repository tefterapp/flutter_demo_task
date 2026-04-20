import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';

class ScoreCardInsights extends StatelessWidget {
  const ScoreCardInsights({required this.insights, super.key});

  final List<String> insights;

  @override
  Widget build(BuildContext context) {
    if (insights.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          for (final insight in insights)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                insight,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
