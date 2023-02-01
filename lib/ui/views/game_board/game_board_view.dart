import 'package:chess/ui/views/game_board/game_board_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:draw_your_image/draw_your_image.dart';
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
      builder: ((context, viewModel, child) => Stack(children: [
            GridView.count(
              key: GlobalObjectKey("board"),
              crossAxisCount: 8,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              clipBehavior: Clip.antiAlias,
              addRepaintBoundaries: true,
              childAspectRatio: MediaQuery.of(context).size.aspectRatio * 0.42,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: viewModel.squares
                  .map(
                    (e) => GestureDetector(
                      onTap: () => viewModel.disableDraw(),
                      onSecondaryTap: () => viewModel.enabledDraw(),
                      child: DragTarget(
                        onAccept: (data) => viewModel.figureDropped(data),
                        builder: (context, candidateData, rejectedData) =>
                            Container(
                                color: e.color,
                                child: Draggable(
                                  key: GlobalObjectKey(e.rowLabel),
                                  dragAnchorStrategy:
                                      (draggable, context, position) =>
                                          pointerDragAnchorStrategy(
                                              draggable, context, position),
                                  onDragUpdate: (details) =>
                                      viewModel.dragUpdated(details),
                                  data: "test",
                                  onDragStarted: () =>
                                      viewModel.dragStarted(e.rowLabel),
                                  feedback: WhiteKing(),
                                  child: e.occupied != null
                                      ? WhiteQueen(
                                          fillColor: ThemeColors.innerText,
                                          strokeColor:
                                              ThemeColors.cardBackground,
                                          size: 6,
                                        )
                                      : Text(""),
                                )),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Visibility(
              visible: viewModel.canDraw,
              child: InkWell(
                onTap: () => viewModel.disableDraw(),
                child: Draw(
                  controller: viewModel.drawController,
                  strokeColor: ThemeColors.mainText,
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
          ])),
    );
  }
}
