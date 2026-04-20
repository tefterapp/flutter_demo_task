import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import '../../../domain/entities/score_type.dart';
import '../../blocs/score_detail/score_detail_bloc.dart';
import '../../blocs/score_detail/score_detail_event.dart';
import '../../widgets/how_it_works_section.dart';
import '../../widgets/info_sheet/show_score_info_sheet.dart';
import '../../widgets/metrics_section/metrics_section.dart';
import '../../widgets/score_card/score_card.dart';
import 'score_detail_page.dart';

class ScoreDetailSuccessBody extends StatelessWidget {
  const ScoreDetailSuccessBody({
    required this.summary,
    required this.timeframe,
    required this.selectedDate,
    required this.detail,
    required this.siblingDetails,
    required this.siblingSummaries,
    super.key,
  });

  final ScoreSummary summary;
  final Timeframe timeframe;
  final DateTime selectedDate;
  final ScoreDetail detail;
  final List<ScoreDetail> siblingDetails;
  final List<ScoreSummary> siblingSummaries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScoreCard.detail(
          summary: summary,
          timeframe: timeframe,
          detail: detail,
          selectedDate: selectedDate,
          onHelpTap: () => showScoreInfoSheet(
            context,
            summary: summary,
            detail: detail,
            selectedDate: selectedDate,
          ),
          onDateChanged: (next) => context.read<ScoreDetailBloc>().add(
            ScoreDetailEvent.dateChanged(next),
          ),
        ),
        const SizedBox(height: 20),
        MetricsSection(
          detail: detail,
          timeframe: timeframe,
          selectedDate: selectedDate,
          siblingDetails: siblingDetails,
          siblingSummaries: siblingSummaries,
          onSiblingTap: (sibling) => _openSibling(context, sibling),
        ),
        const SizedBox(height: 24),
        HowItWorksSection(type: summary.type),
        const SizedBox(height: 8),
      ],
    );
  }

  void _openSibling(BuildContext context, ScoreSummary sibling) {
    final forwarded = [
      for (final s in siblingSummaries)
        if (s.type != sibling.type) s,
    ];
    context.push(
      ScoreDetailPage(
        summary: sibling,
        siblingSummaries: forwarded,
        initialDate: selectedDate,
      ),
    );
  }
}
