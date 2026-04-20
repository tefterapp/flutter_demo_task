import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({
    required this.icon,
    required this.enabled,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = enabled
        ? context.colors.onSurface
        : context.colors.onSurfaceVariant.withValues(alpha: 0.5);
    return GestureDetector(
      onTap: enabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}
