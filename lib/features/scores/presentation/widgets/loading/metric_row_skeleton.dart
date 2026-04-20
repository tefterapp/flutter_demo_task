import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/ui/widgets/skeleton_box.dart';

class MetricRowSkeleton extends StatelessWidget {
  const MetricRowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  SkeletonBox(width: 28, height: 28, borderRadius: 14),
                  SizedBox(width: 10),
                  Expanded(child: SkeletonBox(height: 16)),
                  SizedBox(width: 12),
                  SkeletonBox(width: 44, height: 18),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: SkeletonBox(height: 6, borderRadius: 4),
            ),
          ],
        ),
      ),
    );
  }
}
