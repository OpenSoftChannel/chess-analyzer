import 'package:chess/ui/views/components/game_table/game_table_view.dart';
import 'package:chess/ui/views/components/play_table/play_table_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';
import 'active_game_viewmodel.dart';

class ActiveGame extends StatelessWidget {
  const ActiveGame({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActiveGameViewModel>.reactive(
      builder: (context, model, child) => Material(
          color: ThemeColors.mainThemeBackground,
          child: Center(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: ThemeColors.cardBackground,
                      child: Gametable(),
                    )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: const [
                      Expanded(flex: 1, child: Text("Black ")),
                      Expanded(flex: 10, child: GameBoard()),
                      Expanded(flex: 1, child: Text("White ")),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: ThemeColors.cardBackground,
                      child: PlayActionTable(),
                    ))
              ],
            ),
          )),
      viewModelBuilder: () => ActiveGameViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(context),
    );
  }
}
