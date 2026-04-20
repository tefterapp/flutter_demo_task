import 'package:flutter/material.dart';

import '../../../../../core/ui/widgets/skeleton_box.dart';
import 'metric_row_skeleton.dart';

class MetricsSectionSkeleton extends StatelessWidget {
  const MetricsSectionSkeleton({super.key, this.rowCount = 3});

  final int rowCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SkeletonBox(width: 88, height: 18),
        const SizedBox(height: 8),
        for (var i = 0; i < rowCount; i++) ...[
          const MetricRowSkeleton(),
          if (i != rowCount - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }
}
