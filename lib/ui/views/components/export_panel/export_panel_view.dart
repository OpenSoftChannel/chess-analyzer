import 'package:chess/ui/views/components/export_panel/export_panel_game_details_view.dart';
import 'package:chess/ui/views/components/export_panel/pgn_board_moves_view.dart';
import 'package:chess/ui/views/components/export_panel/share_panel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'export_panel_viewmodel.dart';

class ExportPanel extends StatelessWidget {
  const ExportPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => ExportPanelViewModel()),
      builder: (context, viewModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Expanded(
            child: ExportPanelGameDetails(),
          ),
          Expanded(child: PgnBoardMoves()),
          Expanded(child: SharePanel()),
        ],
      ),
    );
  }
}
