import 'package:flutter/material.dart';

import '../../../../../core/ui/widgets/skeleton_box.dart';

class HowItWorksSkeleton extends StatelessWidget {
  const HowItWorksSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SkeletonBox(width: 140, height: 18),
        SizedBox(height: 10),
        SkeletonBox(height: 14),
        SizedBox(height: 6),
        SkeletonBox(height: 14),
        SizedBox(height: 6),
        SkeletonBox(width: 240, height: 14),
      ],
    );
  }
}
