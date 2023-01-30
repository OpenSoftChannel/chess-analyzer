import 'package:chess/ui/views/components/game_setting_panel/game_settings_panel_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:chess/ui/views/setup/setup_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: Container(
        color: ThemeColors.mainThemeBackground,
        child: Row(
          children: const [
            Expanded(
              flex: 2,
              child: GameSettingsPanel(),
            ),
            Expanded(
              flex: 6,
              child: GameBoard(),
            ),
          ],
        ),
      )),
      viewModelBuilder: () => SetupViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(context),
    );
  }
}
