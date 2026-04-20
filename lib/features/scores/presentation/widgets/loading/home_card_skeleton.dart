import 'package:flutter/material.dart';

import '../../../../../core/ui/widgets/skeleton_box.dart';

class HomeCardSkeleton extends StatelessWidget {
  const HomeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonBox(width: 140, height: 20),
                SkeletonBox(width: 64, height: 20, borderRadius: 10),
              ],
            ),
            SizedBox(height: 8),
            SkeletonBox(width: 72, height: 12),
            SizedBox(height: 18),
            Center(
              child: SkeletonBox(width: 110, height: 110, borderRadius: 55),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
