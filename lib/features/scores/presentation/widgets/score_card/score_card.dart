import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/ui/app_colors.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';
import '../../utils/insights_builder.dart';
import '../../utils/metric_math.dart';
import 'score_card_chart_area.dart';
import 'score_card_header.dart';
import 'score_card_insights.dart';
import 'score_card_size.dart';
import 'score_card_time_range.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard.home({
    required this.summary,
    required this.detail,
    required this.onTap,
    this.size = ScoreCardSize.compact,
    super.key,
  }) : timeframe = Timeframe.d1,
       selectedDate = null,
       titleSuffix = '',
       onHelpTap = null,
       onDateChanged = null,
       showTimeRange = false,
       showInsights = false;

  const ScoreCard.detail({
    required this.summary,
    required this.detail,
    required this.timeframe,
    required this.selectedDate,
    required this.onHelpTap,
    required this.onDateChanged,
    this.size = ScoreCardSize.full,
    super.key,
  }) : onTap = null,
       titleSuffix = null,
       showTimeRange = true,
       showInsights = true;

  final ScoreSummary summary;
  final ScoreDetail detail;
  final Timeframe timeframe;
  final DateTime? selectedDate;

  final VoidCallback? onTap;
  final VoidCallback? onHelpTap;
  final ValueChanged<DateTime>? onDateChanged;

  final ScoreCardSize size;

  final String? titleSuffix;
  final bool showTimeRange;
  final bool showInsights;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final day = selectedDate ?? _todayDate();

    final hasScoreReading =
        scoreValueForTimeframe(
          points: detail.points,
          timeframe: timeframe,
          anchorDate: day,
        ) !=
        null;

    final header = ScoreCardHeader(
      type: summary.type,
      valueLabel: hasScoreReading ? summary.valueLabel : null,
      titleSuffix: titleSuffix ?? l10n.scoreSuffix,
      onHelpTap: onHelpTap,
    );

    final chart = ScoreCardChartArea(
      detail: detail,
      timeframe: timeframe,
      selectedDate: day,
      accentColor: AppColors.forScoreType(summary.type),
      gaugeAreaHeight: size.gaugeAreaHeight,
      gaugeSize: size.gaugeSize,
      chartHeight: size.chartHeight,
    );

    final content = Padding(
      padding: size.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: header),
              if (showTimeRange && onDateChanged != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ScoreCardTimeRange(
                    timeframe: timeframe,
                    anchorDate: day,
                    onDateChanged: onDateChanged!,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          chart,
          if (showInsights)
            ScoreCardInsights(
              insights: buildDynamicInsights(
                detail: detail,
                timeframe: timeframe,
                anchorDate: day,
                l10n: l10n,
              ),
            ),
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(onTap: onTap, child: content),
    );
  }

  static DateTime _todayDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
