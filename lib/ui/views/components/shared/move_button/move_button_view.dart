import 'package:chess/ui/views/components/shared/move_button/move_button_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../../../../Assets/styles.dart';

// ignore: must_be_immutable
class MoveButton extends StatelessWidget {
  late int flex;
  late int direction;
  late IconData btnIcon;

  MoveButton({
    super.key,
    required this.btnIcon,
    required this.direction,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => MoveButtonViewModel()),
      builder: (context, viewModel, child) => Expanded(
        flex: flex,
        child: InkWell(
          onTap: (() => viewModel.getMove(direction)),
          child: Expanded(
            flex: 1,
            child: GeneralTheme.tableHeaderIcon(btnIcon),
          ),
        ),
      ),
    );
  }
}
