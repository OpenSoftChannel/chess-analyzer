import 'package:chess/ui/views/components/shared/player_game_card/player_game_card_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Assets/styles.dart';
import 'game_list_viewmodel.dart';

// ignore: must_be_immutable
class GameList extends StatelessWidget {
  late int flex;

  GameList({super.key, required this.flex});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => GameListViewModel()),
      builder: ((context, viewModel, child) => Expanded(
            flex: 1,
            child: ListView(
              children: viewModel.games
                  .map(
                    (e) => Column(
                      children: [
                        const GameBoard(aspectRationModifier: 0.42),
                        Row(
                          children: [
                            Expanded(child: PlayerGameCard()),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(child: PlayerGameCard()),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
