import 'package:flutter/material.dart';

import '../../../../../core/ui/widgets/skeleton_box.dart';

class DetailCardSkeleton extends StatelessWidget {
  const DetailCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonBox(width: 160, height: 22),
                SkeletonBox(width: 96, height: 32, borderRadius: 16),
              ],
            ),
            SizedBox(height: 8),
            SkeletonBox(width: 72, height: 14),
            SizedBox(height: 24),
            Center(
              child: SkeletonBox(width: 140, height: 140, borderRadius: 70),
            ),
            SizedBox(height: 20),
            Center(child: SkeletonBox(width: 220, height: 14)),
            SizedBox(height: 8),
            Center(child: SkeletonBox(width: 180, height: 14)),
          ],
        ),
      ),
    );
  }
}
