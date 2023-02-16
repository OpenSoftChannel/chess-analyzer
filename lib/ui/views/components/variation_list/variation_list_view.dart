import 'package:chess/ui/views/components/horizontal_score_indicator/horizontal_score_indicator_view.dart';
import 'package:chess/ui/views/components/variation_list/variation_list_viewmodel.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../../domain/Assets/styles.dart';

class VariationList extends StatelessWidget {
  const VariationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VariationListViewModel(),
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.variationsData.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => viewModel.variationSelected(
              viewModel.variationsData.elementAt(index).index),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: ThemeColors.cardBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Games count: 150. | 88% Win -> White, 12% Win-> Black. | Average ELO 1500. Highest ELO 2000",
                        style: TextStyle(color: ThemeColors.mainText),
                      ),
                    ),
                    Row(
                      children: [
                        WhiteQueen(
                          size: 22,
                        ),
                        Text(
                          "e4",
                          style: TextStyle(color: ThemeColors.mainText),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ThemeColors.innerText,
                        ),
                        WhiteQueen(
                          size: 22,
                        ),
                        Text(
                          "e6",
                          style: TextStyle(color: ThemeColors.mainText),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              HorizontalScoreIndicator(
                black: ThemeColors.cardBackground,
                size: 15,
              ),
              Visibility(
                visible: viewModel.variationsData.elementAt(index).isOpen,
                child: SizedBox(
                  height: 300,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_right_outlined,
                          color: ThemeColors.innerText,
                          size: 40,
                        ),
                        Expanded(child: VariationList())
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
