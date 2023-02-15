import 'package:chess/ui/views/components/shared/pgn_grid/pgn_grid_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';

import '../../../../../domain/Assets/styles.dart';

class PgnGrid extends StatelessWidget {
  const PgnGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PgnGridViewModel(),
      builder: (context, viewModel, child) => GridView.count(
        crossAxisCount: 8,
        crossAxisSpacing: 15,
        children: viewModel.gameLines
            .map((e) => FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    decoration: BoxDecoration(
                        color: e
                            ? ThemeColors.mainText
                            : ThemeColors.cardBackground,
                        border: Border.all(
                            color: ThemeColors.mainThemeBackground, width: 1),
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
                ))
            .toList(),
      ),
    );
  }
}
