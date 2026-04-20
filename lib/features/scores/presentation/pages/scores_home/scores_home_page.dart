import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../blocs/scores_home/scores_home_cubit.dart';
import 'scores_home_view.dart';

class ScoresHomePage extends StatelessWidget {
  const ScoresHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScoresHomeCubit>()..load(),
      child: const ScoresHomeView(),
    );
  }
}
