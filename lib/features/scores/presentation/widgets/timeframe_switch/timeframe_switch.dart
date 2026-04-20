import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_type.dart';
import 'timeframe_switch_tab.dart';

class TimeframeSwitch extends StatelessWidget {
  const TimeframeSwitch({
    required this.selected,
    required this.onSelectionChanged,
    this.enabled = true,
    super.key,
  });

  final Timeframe selected;
  final ValueChanged<Timeframe> onSelectionChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tabs = <TimeframeSwitchTab>[
      TimeframeSwitchTab(
        timeframe: Timeframe.d1,
        label: l10n.timeframe1d,
        isSelected: selected == Timeframe.d1,
        enabled: enabled,
        onTap: onSelectionChanged,
      ),
      TimeframeSwitchTab(
        timeframe: Timeframe.d7,
        label: l10n.timeframe7d,
        isSelected: selected == Timeframe.d7,
        enabled: enabled,
        onTap: onSelectionChanged,
      ),
      TimeframeSwitchTab(
        timeframe: Timeframe.d30,
        label: l10n.timeframe30d,
        isSelected: selected == Timeframe.d30,
        enabled: enabled,
        onTap: onSelectionChanged,
      ),
      TimeframeSwitchTab(
        timeframe: Timeframe.y1,
        label: l10n.timeframe1y,
        isSelected: selected == Timeframe.y1,
        enabled: enabled,
        onTap: onSelectionChanged,
      ),
    ];

    final row = Row(children: tabs);
    if (enabled) {
      return row;
    }
    return Opacity(opacity: 0.5, child: IgnorePointer(child: row));
  }
}
