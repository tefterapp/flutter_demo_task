import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../domain/entities/score_detail.dart';
import '../../../domain/entities/score_summary.dart';
import 'score_info_sheet_content.dart';

Future<void> showScoreInfoSheet(
  BuildContext context, {
  required ScoreSummary summary,
  required ScoreDetail detail,
  required DateTime selectedDate,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.colors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => ScoreInfoSheetContent(
      summary: summary,
      detail: detail,
      selectedDate: selectedDate,
    ),
  );
}
