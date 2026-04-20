import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../domain/entities/score_summary.dart';
import '../../blocs/score_detail/score_detail_bloc.dart';
import '../../blocs/score_detail/score_detail_event.dart';
import 'score_detail_view.dart';

class ScoreDetailPage extends StatelessWidget {
  const ScoreDetailPage({
    required this.summary,
    this.siblingSummaries = const [],
    this.initialDate,
    super.key,
  });

  final ScoreSummary summary;
  final List<ScoreSummary> siblingSummaries;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = getIt<ScoreDetailBloc>();
        if (initialDate != null) {
          bloc.add(ScoreDetailEvent.dateChanged(initialDate!));
        }
        bloc.add(ScoreDetailEvent.started(summary));
        return bloc;
      },
      child: ScoreDetailView(
        pageSummary: summary,
        siblingSummaries: siblingSummaries,
      ),
    );
  }
}
