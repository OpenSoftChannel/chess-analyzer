import 'package:chess/ui/views/components/shared/score_counter/score_counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Assets/styles.dart';

class ScoreCounterView extends StatelessWidget {
  final Function callback;

  const ScoreCounterView({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.ready(callback),
      viewModelBuilder: (() => ScoreCounterViewModel()),
      builder: (context, viewModel, child) => Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: ThemeColors.mainThemeBackground,
              onPressed: (() => viewModel.decrementButton()),
              icon: Icon(
                Icons.remove,
                color: ThemeColors.mainText,
              ),
            ),
            Text(
              viewModel.score.toString(),
              style: GeneralTheme.inputDecorationText,
              textAlign: TextAlign.center,
            ),
            IconButton(
              color: ThemeColors.mainThemeBackground,
              onPressed: (() => viewModel.incrementButton()),
              icon: Icon(
                Icons.add,
                color: ThemeColors.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
