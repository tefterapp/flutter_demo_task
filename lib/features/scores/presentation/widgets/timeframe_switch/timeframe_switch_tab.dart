import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_type.dart';

class TimeframeSwitchTab extends StatelessWidget {
  const TimeframeSwitchTab({
    required this.timeframe,
    required this.label,
    required this.isSelected,
    required this.enabled,
    required this.onTap,
    super.key,
  });

  final Timeframe timeframe;
  final String label;
  final bool isSelected;
  final bool enabled;
  final ValueChanged<Timeframe> onTap;

  @override
  Widget build(BuildContext context) {
    final base = context.colors.onSurface;
    final titleColor = isSelected ? base : base.withValues(alpha: 0.6);
    final underlineColor = isSelected ? base : base.withValues(alpha: 0.1);

    return Expanded(
      child: InkWell(
        onTap: enabled && !isSelected ? () => onTap(timeframe) : null,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150),
                style: context.textTheme.labelLarge!.copyWith(
                  color: titleColor,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
                child: Text(label),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: underlineColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
