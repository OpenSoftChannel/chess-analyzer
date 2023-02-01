import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:chess/ui/views/components/game_table/game_table_view.dart';
import 'package:chess/ui/views/components/play_table/play_table_view.dart';
import 'package:chess/ui/views/components/shared/player_game_card/player_game_card_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';
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
                Expanded(
                  flex: 2,
                  child: Container(
                    color: ThemeColors.cardBackground,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 0,
                          child: CardComponent(
                            render: Row(
                              children: [
                                ElevatedIconButton(
                                    icon: Icons.chat,
                                    label: "Live chat",
                                    callback: () => {}),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedIconButton(
                                    icon: Icons.speaker_notes_outlined,
                                    label: "Game notes",
                                    callback: () => {}),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedIconButton(
                                    icon: Icons.list_alt,
                                    label: "Active Games",
                                    callback: () => {}),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedIconButton(
                                    icon: Icons.menu_open_rounded,
                                    label: "Return to menu",
                                    callback: () => {}),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: const [
                                    BubbleSpecialThree(
                                      text: 'Added iMassage shape bubbles',
                                      color: Color(0xFF1B97F3),
                                      tail: false,
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    BubbleSpecialThree(
                                      text:
                                          'Please try and give some feedback on it!',
                                      color: Color(0xFF1B97F3),
                                      tail: true,
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    BubbleSpecialThree(
                                      text: 'Sure',
                                      color: Color(0xFFE8E8EE),
                                      tail: false,
                                      isSender: false,
                                    ),
                                    BubbleSpecialThree(
                                      text: "I tried. It's awesome!!!",
                                      color: Color(0xFFE8E8EE),
                                      tail: false,
                                      isSender: false,
                                    ),
                                    BubbleSpecialThree(
                                      text: "Thanks",
                                      color: Color(0xFFE8E8EE),
                                      tail: true,
                                      isSender: false,
                                    )
                                  ],
                                ),
                              ),
                              MessageBar(
                                onSend: (_) => print(_),
                                actions: [
                                  InkWell(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    onTap: () {},
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(""),
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 300, child: PlayerGameCard()),
                          const Expanded(child: Text("")),
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
                        child: GameBoard(),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 300, child: PlayerGameCard()),
                          const Expanded(child: Text("")),
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
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(""),
                  flex: 1,
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
