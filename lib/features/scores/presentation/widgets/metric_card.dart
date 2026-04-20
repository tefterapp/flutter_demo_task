import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../utils/metric_math.dart';
import 'metric_icon.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    required this.title,
    required this.valueText,
    required this.icon,
    required this.iconColor,
    required this.isEmpty,
    required this.avgLabel,
    this.progress0to100,
    this.onTap,
    super.key,
  });

  final String title;
  final String icon;
  final Color iconColor;
  final String valueText;
  final double? progress0to100;
  final bool isEmpty;
  final String avgLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final muted = colors.onSurfaceVariant;
    final valueStyle = isEmpty
        ? context.textTheme.titleMedium?.copyWith(color: muted)
        : context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
    final progress = progress0to100;
    final barColor = progress != null && !isEmpty
        ? metricProgressColor(progress)
        : colors.outlineVariant;

    const radius = BorderRadius.all(Radius.circular(12));

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
          child: Row(
            children: [
              MetricIcon(keyName: icon, color: iconColor),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.labelLarge?.copyWith(color: muted),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(valueText, style: valueStyle, textAlign: TextAlign.right),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (isEmpty || progress == null) ? 0 : progress / 100,
              minHeight: 6,
              backgroundColor: colors.surfaceContainerHigh,
              color: barColor,
            ),
          ),
        ),
      ],
    );

    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(color: colors.outlineVariant.withValues(alpha: 0.6)),
      ),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(onTap: onTap, borderRadius: radius, child: content),
    );
  }
}
