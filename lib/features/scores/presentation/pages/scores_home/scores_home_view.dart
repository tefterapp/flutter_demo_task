import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../blocs/scores_home/scores_home_cubit.dart';
import '../../blocs/scores_home/scores_home_state.dart';
import '../../widgets/loading/scores_home_loading_placeholder.dart';
import '../../widgets/message_block.dart';
import 'scores_home_success_body.dart';

class ScoresHomeView extends StatelessWidget {
  const ScoresHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: SafeArea(
        top: false,
        child: BlocBuilder<ScoresHomeCubit, ScoresHomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const ScoresHomeLoadingPlaceholder(),
              loading: () => const ScoresHomeLoadingPlaceholder(),
              success: (cards) => ScoresHomeSuccessBody(cards: cards),
              empty: () => Center(
                child: MessageBlock(
                  title: l10n.emptyTitle,
                  message: l10n.emptyMessage,
                  onRetry: () => context.read<ScoresHomeCubit>().retry(),
                ),
              ),
              failure: (failure) => Center(
                child: MessageBlock(
                  title: l10n.errorTitle,
                  message: failure.message.isNotEmpty
                      ? failure.message
                      : l10n.errorMessage,
                  onRetry: () => context.read<ScoresHomeCubit>().retry(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
