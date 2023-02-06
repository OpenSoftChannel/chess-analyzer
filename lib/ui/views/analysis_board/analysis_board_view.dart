import 'package:chess/ui/views/analysis_board/analysis_board_viewmodel.dart';
import 'package:chess/ui/views/components/analysis_options_panel/analysis_options_panel_view.dart';
import 'package:chess/ui/views/components/engine_lines_panel/engine_lines_panel_view.dart';
import 'package:chess/ui/views/components/game_table/game_table_view.dart';
import 'package:chess/ui/views/components/shared/empty_container.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/Assets/styles.dart';
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
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 0,
                                      child: Container(
                                        color: ThemeColors.mainText,
                                        child: const Opacity(
                                            opacity: 0, child: Text("slider")),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        color: ThemeColors.mainThemeBackground,
                                        child: const Opacity(
                                            opacity: 0, child: Text("slider")),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 300,
                                            child: PlayerGameCard()),
                                        const Expanded(
                                          child: Text(""),
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
                                                backgroundColor:
                                                    ThemeColors.innerText,
                                                progress: 0.5,
                                                progressStrokeCap:
                                                    StrokeCap.round,
                                                backgroundStrokeCap:
                                                    StrokeCap.round,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const Expanded(
                                      child: GameBoard(
                                          aspectRationModifier: 0.485),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 300,
                                            child: PlayerGameCard()),
                                        const Expanded(
                                          child: Text(""),
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
                                                backgroundColor:
                                                    ThemeColors.innerText,
                                                progress: 0.5,
                                                progressStrokeCap:
                                                    StrokeCap.round,
                                                backgroundStrokeCap:
                                                    StrokeCap.round,
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
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
