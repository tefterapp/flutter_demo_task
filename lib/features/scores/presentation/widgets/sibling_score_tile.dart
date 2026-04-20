import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/ui/app_colors.dart';
import '../../domain/entities/score_type.dart';
import '../constants/metric_keys.dart';
import '../utils/score_type_title.dart';
import 'metric_card.dart';

class SiblingScoreTile extends StatelessWidget {
  const SiblingScoreTile({
    required this.type,
    required this.score,
    required this.onTap,
    super.key,
  });

  final ScoreType type;
  final double? score;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasScore = score != null;
    final clamped = hasScore ? score!.clamp(0, 100).toDouble() : null;

    return MetricCard(
      title: scoreTypeLocalizedTitle(l10n, type),
      icon: type.iconKey,
      iconColor: AppColors.forScoreType(type),
      valueText: hasScore ? '${score!.round()}' : l10n.labelNoData,
      isEmpty: !hasScore,
      avgLabel: l10n.labelAvg,
      progress0to100: clamped,
      onTap: onTap,
    );
  }
}
