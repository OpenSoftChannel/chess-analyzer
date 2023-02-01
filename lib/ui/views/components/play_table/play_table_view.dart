import 'package:chess/Assets/styles.dart';
import 'package:chess/ui/views/components/play_table/play_table_viewmodel.dart';
import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:chess/ui/views/components/shared/move_button/move_button_view.dart';
import 'package:chess/ui/views/components/shared/table_move_row/table_move_row.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../shared/card_component.dart';
import '../shared/game_table_row/game_table_row_view.dart';

class PlayActionTable extends StatelessWidget {
  const PlayActionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => PlayActionTableViewModel()),
      builder: (context, viewModel, child) => Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: 56,
              itemBuilder: (context, index) => TableMoveRow(
                callback: () => {},
                move: "1.",
                whitePlay: "0-0-0",
                blackPlay: "qc1",
              ),
            ),
          ),
          Divider(height: 1, color: ThemeColors.innerText),
          CardComponent(
            render: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MoveButton(
                    btnIcon: Icons.keyboard_double_arrow_left,
                    direction: 3,
                    flex: 1),
                MoveButton(
                    btnIcon: Icons.arrow_back_ios, direction: 1, flex: 1),
                MoveButton(
                    btnIcon: Icons.arrow_forward_ios, direction: 2, flex: 1),
                MoveButton(
                    btnIcon: Icons.keyboard_double_arrow_right,
                    direction: 3,
                    flex: 1)
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: CardComponent(
              render: Row(
                children: [
                  Expanded(
                    child: ElevatedIconButton(
                        icon: Icons.leave_bags_at_home_outlined,
                        label: "Resign",
                        callback: () => {}),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedIconButton(
                        icon: Icons.handshake,
                        label: "Offer a draw",
                        callback: () => {}),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
