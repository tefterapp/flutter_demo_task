import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/timeframe_navigation.dart';
import '../chevron_icon.dart';

class ScoreCardTimeRange extends StatelessWidget {
  const ScoreCardTimeRange({
    required this.timeframe,
    required this.anchorDate,
    required this.onDateChanged,
    super.key,
  });

  final Timeframe timeframe;
  final DateTime anchorDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final rangeLabel = timeRangeLabel(
      timeframe: timeframe,
      anchorDate: anchorDate,
      locale: locale,
    );
    final forwardEnabled = canGoForward(
      timeframe: timeframe,
      anchorDate: anchorDate,
      todayDate: todayDate,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        ChevronIcon(
          icon: Icons.chevron_left,
          enabled: true,
          onTap: () =>
              onDateChanged(shiftAnchorDate(timeframe, anchorDate, -1)),
        ),
        Text(rangeLabel, style: context.textTheme.bodyMedium),
        ChevronIcon(
          icon: Icons.chevron_right,
          enabled: forwardEnabled,
          onTap: forwardEnabled
              ? () => onDateChanged(shiftAnchorDate(timeframe, anchorDate, 1))
              : null,
        ),
      ],
    );
  }
}
