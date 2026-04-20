import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/home_score_card.dart';
import '../../blocs/scores_home/scores_home_cubit.dart';
import '../../widgets/score_card/score_card.dart';
import '../score_detail/score_detail_page.dart';

class ScoresHomeSuccessBody extends StatelessWidget {
  const ScoresHomeSuccessBody({required this.cards, super.key});

  final List<HomeScoreCard> cards;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ScoresHomeCubit>().refresh(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16).copyWith(bottom: 24),
        itemCount: cards.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final card = cards[index];
          return ScoreCard.home(
            summary: card.summary,
            detail: card.d1Detail,
            onTap: () => context.push(
              ScoreDetailPage(
                summary: card.summary,
                siblingSummaries: cards.siblingSummariesFor(card.summary.type),
              ),
            ),
          );
        },
      ),
    );
  }
}
