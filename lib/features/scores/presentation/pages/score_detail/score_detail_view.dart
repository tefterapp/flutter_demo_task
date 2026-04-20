import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_summary.dart';
import '../../blocs/score_detail/score_detail_bloc.dart';
import '../../blocs/score_detail/score_detail_event.dart';
import '../../blocs/score_detail/score_detail_state.dart';
import '../../utils/score_type_title.dart';
import '../../widgets/timeframe_switch/timeframe_switch.dart';
import 'score_detail_body.dart';

class ScoreDetailView extends StatelessWidget {
  const ScoreDetailView({
    required this.pageSummary,
    required this.siblingSummaries,
    super.key,
  });

  final ScoreSummary pageSummary;
  final List<ScoreSummary> siblingSummaries;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreDetailBloc, ScoreDetailState>(
      builder: (context, state) {
        final headerSummary = state is ScoreDetailInitial
            ? pageSummary
            : state.summary;
        final title = scoreTypeLocalizedTitle(context.l10n, headerSummary.type);
        return Scaffold(
          backgroundColor: context.colors.surfaceContainerLow,
          appBar: AppBar(title: Text(title)),
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: () =>
                  context.read<ScoreDetailBloc>().waitForRefreshComplete(),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16).copyWith(bottom: 24),
                children: [
                  TimeframeSwitch(
                    selected: state.timeframe,
                    enabled: state.maybeWhen(
                      loading: (_, __, ___) => false,
                      orElse: () => true,
                    ),
                    onSelectionChanged: (tf) => context
                        .read<ScoreDetailBloc>()
                        .add(ScoreDetailEvent.timeframeChanged(tf)),
                  ),
                  const SizedBox(height: 12),
                  ScoreDetailBody(
                    state: state,
                    siblingSummaries: siblingSummaries,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
