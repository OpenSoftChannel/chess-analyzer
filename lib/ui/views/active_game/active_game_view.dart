import 'package:chess/ui/views/components/active_game_properties_panel/active_game_properties_panel_view.dart';
import 'package:chess/ui/views/components/material_panel/material_panel_view.dart';
import 'package:chess/ui/views/components/play_table/play_table_view.dart';
import 'package:chess/ui/views/components/shared/player_game_card/player_game_card_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';

import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/Assets/styles.dart';

import '../components/concolusion_panel/conclusion_panel_view.dart';
import '../components/shared/IconButton/elevated_icon_button.dart';
import '../components/shared/card_component.dart';
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
                const Expanded(
                  flex: 2,
                  child: ActiveGamePropertiesPanel(),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 300, child: PlayerGameCard()),
                          const Expanded(
                            child: MaterialPanel(isWhite: true),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  "05:16",
                                  style: TextStyle(
                                      color: ThemeColors.mainText,
                                      fontSize: 60),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Progresso(
                                  backgroundColor: ThemeColors.innerText,
                                  progress: 0.5,
                                  progressStrokeCap: StrokeCap.round,
                                  backgroundStrokeCap: StrokeCap.round,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Expanded(
                        flex: 10,
                        child: GameBoard(aspectRationModifier: 0.485),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 300, child: PlayerGameCard()),
                          const Expanded(
                            child: MaterialPanel(isWhite: false),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  "05:16",
                                  style: TextStyle(
                                      color: ThemeColors.mainText,
                                      fontSize: 60),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Progresso(
                                  backgroundColor: ThemeColors.innerText,
                                  progress: 0.5,
                                  progressStrokeCap: StrokeCap.round,
                                  backgroundStrokeCap: StrokeCap.round,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: ThemeColors.cardBackground,
                      child: Column(
                        children: [
                          Visibility(
                            visible: model.gameEnded,
                            child: Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  ConclusionPanel(),
                                  ConclusionPanel(),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: ThemeColors.mainText,
                          ),
                          const Expanded(
                            flex: 10,
                            child: PlayActionTable(),
                          ),
                          Expanded(
                            flex: 0,
                            child: CardComponent(
                              render: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedIconButton(
                                        icon: Icons.leave_bags_at_home_outlined,
                                        label: "Resign",
                                        callback: () => model.triggerEnd()),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: ElevatedIconButton(
                                        icon: Icons.handshake,
                                        label: "Offer a draw",
                                        callback: () => model.openAnalistys()),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
      viewModelBuilder: () => ActiveGameViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(context),
    );
  }
}
