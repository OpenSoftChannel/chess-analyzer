import 'package:chess/ui/views/components/shared/score_counter/score_counter_view.dart';
import 'package:chess/ui/views/components/shared/table_header_scorepicker/table_header_scorepicker_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Assets/styles.dart';

class TableHeaderScorePicker extends StatelessWidget {
  final int flex;
  final TextAlign alignment;
  final IconData icon;
  final String label;
  final Function callback;

  const TableHeaderScorePicker({
    super.key,
    required this.flex,
    required this.alignment,
    required this.icon,
    required this.label,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.ready(callback),
      viewModelBuilder: (() => TableHeaderScorePickerViewModel()),
      builder: (context, viewModel, child) => Expanded(
        flex: 1,
        child: Visibility(
          visible: viewModel.showScorePicker,
          replacement: InkWell(
            onTap: viewModel.scorePickerSelected,
            child: Row(
              children: [
                Expanded(
                  flex: flex,
                  child: GeneralTheme.tableHeaderIcon(
                      icon, null, ThemeColors.mainText),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    label,
                    style: GeneralTheme.inputDecorationText,
                    textAlign: alignment,
                  ),
                ),
              ],
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCounterView(
                  callback: viewModel.whiteValueChanged,
                ),
                VerticalDivider(
                  thickness: 1,
                  color: ThemeColors.innerText,
                ),
                ScoreCounterView(
                  callback: viewModel.blackValueChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
