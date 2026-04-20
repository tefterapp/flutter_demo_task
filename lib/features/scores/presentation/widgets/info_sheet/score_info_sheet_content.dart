import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/ui/app_colors.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/timeframe.dart';
import '../../utils/score_type_title.dart';
import '../how_it_works_section.dart';
import '../score_card/score_card_chart_area.dart';
import '../score_card/score_card_size.dart';
import 'info_metrics_list.dart';

class ScoreInfoSheetContent extends StatelessWidget {
  const ScoreInfoSheetContent({
    required this.summary,
    required this.detail,
    required this.selectedDate,
    super.key,
  });

  final ScoreSummary summary;
  final ScoreDetail detail;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final title =
        '${scoreTypeLocalizedTitle(l10n, summary.type)}${l10n.scoreSuffix}';
    final anchorDay = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    const size = ScoreCardSize.compact;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 8, 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            children: [
              Padding(
                padding: size.contentPadding,
                child: ScoreCardChartArea(
                  detail: detail,
                  timeframe: Timeframe.d1,
                  selectedDate: selectedDate,
                  accentColor: AppColors.forScoreType(summary.type),
                  gaugeAreaHeight: size.gaugeAreaHeight,
                  gaugeSize: size.gaugeSize,
                  chartHeight: size.chartHeight,
                ),
              ),
              const SizedBox(height: 20),
              InfoMetricsList(
                detail: detail,
                selectedDate: anchorDay,
                locale: Localizations.localeOf(context).toString(),
                noDataLabel: l10n.labelNoData,
              ),
              const SizedBox(height: 24),
              HowItWorksSection(type: summary.type),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
