import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_summary.dart';
import '../../blocs/score_detail/score_detail_bloc.dart';
import '../../blocs/score_detail/score_detail_event.dart';
import '../../blocs/score_detail/score_detail_state.dart';
import '../../widgets/loading/score_detail_loading_placeholder.dart';
import '../../widgets/message_block.dart';
import 'score_detail_success_body.dart';

class ScoreDetailBody extends StatelessWidget {
  const ScoreDetailBody({
    required this.state,
    required this.siblingSummaries,
    super.key,
  });

  final ScoreDetailState state;
  final List<ScoreSummary> siblingSummaries;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return state.when(
      initial: (_, __, ___) => const ScoreDetailLoadingPlaceholder(),
      loading: (_, __, ___) => const ScoreDetailLoadingPlaceholder(),
      success:
          (summary, timeframe, selectedDate, detail, isEmpty, siblingDetails) {
            if (isEmpty) {
              return MessageBlock(
                title: l10n.emptyTitle,
                message: l10n.emptyMessage,
                onRetry: () => context.read<ScoreDetailBloc>().add(
                  const ScoreDetailEvent.refreshed(),
                ),
              );
            }
            return ScoreDetailSuccessBody(
              summary: summary,
              timeframe: timeframe,
              selectedDate: selectedDate,
              detail: detail,
              siblingDetails: siblingDetails,
              siblingSummaries: siblingSummaries,
            );
          },
      failure: (_, __, ___, failure) => MessageBlock(
        title: l10n.errorTitle,
        message: failure.message.isNotEmpty
            ? failure.message
            : l10n.errorMessage,
        onRetry: () => context.read<ScoreDetailBloc>().add(
          const ScoreDetailEvent.refreshed(),
        ),
      ),
    );
  }
}
