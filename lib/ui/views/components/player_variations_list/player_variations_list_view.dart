import 'package:chess/ui/views/components/player_variations_list/player_variations_list_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';

class PlayerVariationsList extends StatelessWidget {
  const PlayerVariationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PlayerVariationsListViewModel(),
      builder: (context, viewModel, child) => Column(
        children: [
          Container(
            color: ThemeColors.cardBackground,
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: ThemeColors.mainText,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Elo Scrore",
                    style: TextStyle(
                      color: ThemeColors.mainText,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Repetitions",
                    style: TextStyle(
                      color: ThemeColors.mainText,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.playerMoves.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "John Doe",
                          style: TextStyle(
                            color: ThemeColors.mainText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "1200",
                          style: TextStyle(
                            color: ThemeColors.mainText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WhiteKing(
                              size: 30,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: ThemeColors.mainText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BlackKing(
                              size: 30,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: ThemeColors.mainText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: ThemeColors.innerText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
