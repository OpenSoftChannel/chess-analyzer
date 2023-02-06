import 'package:chess/ui/views/components/game_setting_panel/game_settings_panel_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';

class GameSettingsPanel extends StatelessWidget {
  const GameSettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => GameSettingsPanelviewModel()),
      onViewModelReady: (viewModel) => viewModel.initialise(context),
      builder: ((context, viewModel, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Select the game interval",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async => await viewModel.intervalPicker()),
                  child: Icon(
                    Icons.timer,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Incremental interval",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async =>
                      await viewModel.selectIncrementInterval()),
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Begin Game",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async => await viewModel.beginGame()),
                  child: Icon(
                    Icons.not_started_outlined,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
