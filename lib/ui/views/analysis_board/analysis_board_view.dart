import 'package:chess/ui/views/analysis_board/analysis_board_viewmodel.dart';
import 'package:chess/ui/views/components/analysis_options_panel/analysis_options_panel_view.dart';
import 'package:chess/ui/views/components/engine_lines_panel/engine_lines_panel_view.dart';
import 'package:chess/ui/views/components/game_accuracy_slider/game_accuracy_slider.dart';
import 'package:chess/ui/views/components/player_session_panel/player_session_panel.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/Assets/styles.dart';
import '../components/concolusion_panel/conclusion_panel_view.dart';
import '../components/play_table/play_table_view.dart';
import '../components/shared/player_game_card/player_game_card_view.dart';

class AnalysisBoard extends StatelessWidget {
  const AnalysisBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => AnalysisBoardViewModel()),
      builder: (context, viewModel, child) => Material(
        color: ThemeColors.mainThemeBackground,
        child: Row(
          children: [
            Expanded(
              flex: MediaQuery.of(context).size.width > 1920 ? 10 : 14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: MediaQuery.of(context).size.width > 1920 ? 5 : 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: GameAccuracySlider(
                                  black: 4,
                                  white: 1,
                                  rounding: 0,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const PlayerSessionPanel(),
                                    const Expanded(
                                      child: GameBoard(
                                          aspectRationModifier: 0.485),
                                    ),
                                    const PlayerSessionPanel(),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(flex: 8, child: EngineLinesPanel()),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AnalysisOptionsPanel(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: ThemeColors.cardBackground,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ConclusionPanel(),
                          ConclusionPanel(),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: ThemeColors.innerText,
                    ),
                    Expanded(
                      flex: 10,
                      child: PlayActionTable(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
