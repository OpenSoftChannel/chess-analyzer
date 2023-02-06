import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';

import 'package:progresso/progresso.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';
import 'engine_lines_panel_viewmodel.dart';

class EngineLinesPanel extends StatelessWidget {
  const EngineLinesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => EngineLinesPanelViewModel()),
      builder: (context, viewModel, child) => Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Progresso(
                backgroundColor: ThemeColors.innerText,
                progress: 0.9,
                progressStrokeCap: StrokeCap.square,
                backgroundStrokeCap: StrokeCap.square,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: ThemeColors.cardBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "+8.0",
                    style: TextStyle(
                      color: ThemeColors.defaultBtnColor,
                      fontSize: 35,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Stockfish 14+",
                            style: TextStyle(
                              color: ThemeColors.mainText,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "NNUE",
                            style: TextStyle(
                              color: ThemeColors.innerText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Depth 27/28, 6868k nodes/s",
                            style: TextStyle(
                              color: ThemeColors.mainText,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "NNUE",
                            style: TextStyle(
                              color: ThemeColors.innerText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.dangerous,
                        color: ThemeColors.mainText,
                      ),
                      Switch(value: false, onChanged: ((value) => {}))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "+2",
                          style: TextStyle(
                            color: ThemeColors.defaultBtnColor,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 30,
                          width: 2,
                          color: ThemeColors.mainText,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                            color: ThemeColors.mainText,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ThemeColors.mainText,
                              border: Border.all(
                                  color: ThemeColors.mainThemeBackground,
                                  width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onHover: ((value) => {}),
                            onTap: (() => {}),
                            child: Row(
                              children: [
                                WhitePawn(
                                  fillColor: ThemeColors.innerText,
                                  size: 23,
                                ),
                                Text(
                                  "e2",
                                  style: TextStyle(
                                    color: ThemeColors.innerText,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        InkWell(
                          onHover: ((value) => {}),
                          onTap: (() => {}),
                          child: Row(
                            children: [
                              WhitePawn(
                                fillColor: ThemeColors.innerText,
                                size: 23,
                              ),
                              Text(
                                "e2",
                                style: TextStyle(
                                  color: ThemeColors.innerText,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: ThemeColors.mainText,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
