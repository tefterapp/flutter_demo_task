import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/ui/app_assets.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/score_type_title.dart';

class ScoreCardHeader extends StatelessWidget {
  const ScoreCardHeader({
    required this.type,
    required this.titleSuffix,
    this.valueLabel,
    this.onHelpTap,
    super.key,
  });

  final ScoreType type;
  final String? valueLabel;
  final String titleSuffix;
  final VoidCallback? onHelpTap;

  @override
  Widget build(BuildContext context) {
    final title = '${scoreTypeLocalizedTitle(context.l10n, type)}$titleSuffix';
    final showValueLabel = valueLabel != null && valueLabel!.trim().isNotEmpty;
    final showHelpIcon = onHelpTap != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showHelpIcon) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onHelpTap,
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: VectorGraphic(
                    loader: const AssetBytesLoader(
                      AppAssets.iconInfoQuestionMark,
                    ),
                    colorFilter: ColorFilter.mode(
                      context.colors.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        if (showValueLabel) ...[
          const SizedBox(height: 6),
          Text(
            valueLabel!,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
        ],
      ],
    );
  }
}
