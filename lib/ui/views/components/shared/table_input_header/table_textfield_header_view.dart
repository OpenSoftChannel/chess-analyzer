import 'package:chess/ui/views/components/shared/table_input_header/table_textfield_header_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../Assets/styles.dart';

class TableTextfieldHeaderView extends StatelessWidget {
  final int flex;
  final Widget icon;
  final String label;
  final TextAlign aligment;
  final Function callback;

  const TableTextfieldHeaderView(
      {super.key,
      required this.flex,
      required this.icon,
      required this.label,
      required this.aligment,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TabletextfieldHeaderViewModel(),
      builder: (context, viewModel, child) => Expanded(
        flex: flex,
        child: Visibility(
          visible: viewModel.showFilter,
          replacement: InkWell(
            onTap: viewModel.filterSelected,
            child: Row(
              children: [
                icon,
                Expanded(
                  flex: 1,
                  child: Text(
                    label,
                    style: GeneralTheme.inputDecorationText,
                    textAlign: aligment,
                  ),
                ),
              ],
            ),
          ),
          child: TextField(
            onChanged: ((value) => viewModel.valueChanged(value, callback)),
            toolbarOptions: const ToolbarOptions(
              copy: true,
              paste: true,
              cut: true,
              selectAll: true,
            ),
            autofocus: true,
            style: GeneralTheme.inputDecorationText,
            cursorColor: ThemeColors.mainText,
            autocorrect: false,
            obscureText: false,
            decoration: GeneralTheme.inputDecoration,
          ),
        ),
      ),
    );
  }
}
