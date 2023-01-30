import 'package:chess/ui/views/components/game_table/game_table_viewmodel.dart';
import 'package:chess/ui/views/components/shared/game_table_row/game_table_row_view.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../shared/card_component.dart';
import '../shared/table_datepicker_header/table_datepicker_header_view.dart';
import '../shared/table_header_scorepicker/table_header_scorepicker_view.dart';
import '../shared/table_input_header/table_textfield_header_view.dart';

class Gametable extends StatelessWidget {
  const Gametable({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => GameTableViewModel()),
      builder: ((context, viewModel, child) => Column(
            children: [
              Expanded(
                flex: 0,
                child: CardComponent(
                  render: Row(
                    children: [
                      TableTextfieldHeaderView(
                        flex: 2,
                        icon: Expanded(
                          flex: 0,
                          child: WhiteKing(
                            size: 50,
                          ),
                        ),
                        label: "White",
                        aligment: TextAlign.center,
                        callback: viewModel.whiteFilterChanged,
                      ),
                      TableTextfieldHeaderView(
                        flex: 2,
                        icon: Expanded(
                          flex: 0,
                          child: BlackKing(
                            size: 50,
                          ),
                        ),
                        label: "Black",
                        aligment: TextAlign.center,
                        callback: viewModel.blackFilterChanged,
                      ),
                      TableDatePickerHeaderView(
                          flex: 1,
                          alignment: TextAlign.center,
                          icon: Icons.date_range,
                          label: "Date",
                          callback: viewModel.dateFilterSelected),
                      TableHeaderScorePicker(
                          flex: 1,
                          alignment: TextAlign.center,
                          icon: Icons.bar_chart,
                          label: "Outcomes",
                          callback: viewModel.scoreFilter),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: 56,
                  itemBuilder: (context, index) => GameTableRow(),
                ),
              )
            ],
          )),
    );
  }
}
