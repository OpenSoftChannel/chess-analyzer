import 'package:chess/ui/views/game_board/game_board_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';

// ignore: must_be_immutable
class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => GameboardViewModel(null, null)),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: ((context, viewModel, child) => Material(
            color: ThemeColors.mainThemeBackground,
            child: GridView.count(
              crossAxisCount: 8,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              clipBehavior: Clip.antiAlias,
              addRepaintBoundaries: true,
              childAspectRatio: MediaQuery.of(context).size.aspectRatio * 0.75,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: viewModel.squares
                  .map(
                    (e) => Container(
                      color: e.color,
                      child: e.occupied != null
                          ? WhiteQueen(
                              fillColor: ThemeColors.innerText,
                              strokeColor: ThemeColors.cardBackground,
                              size: 6,
                            )
                          : Text(""),
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
