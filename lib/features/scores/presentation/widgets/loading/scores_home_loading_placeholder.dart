import 'package:flutter/material.dart';

import 'home_card_skeleton.dart';

class ScoresHomeLoadingPlaceholder extends StatelessWidget {
  const ScoresHomeLoadingPlaceholder({super.key, this.cardCount = 3});

  final int cardCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: cardCount,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => const HomeCardSkeleton(),
    );
  }
}
