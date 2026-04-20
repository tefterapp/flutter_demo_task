import 'package:flutter/material.dart';

import 'detail_card_skeleton.dart';
import 'how_it_works_skeleton.dart';
import 'metrics_section_skeleton.dart';

class ScoreDetailLoadingPlaceholder extends StatelessWidget {
  const ScoreDetailLoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DetailCardSkeleton(),
        SizedBox(height: 20),
        MetricsSectionSkeleton(),
        SizedBox(height: 24),
        HowItWorksSkeleton(),
        SizedBox(height: 8),
      ],
    );
  }
}
