import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:chess/ui/views/components/active_game_properties_panel/active_game_properties_panel_viewmodel.dart';
import 'package:chess/ui/views/components/chat_box/chat_box_view.dart';
import 'package:chess/ui/views/components/game_notes/game_notes_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Assets/styles.dart';
import '../shared/IconButton/elevated_icon_button.dart';
import '../shared/card_component.dart';

class ActiveGamePropertiesPanel extends StatelessWidget {
  const ActiveGamePropertiesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => ActiveGamePropertiesPanelViewModel()),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Container(
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
                        callback: () => viewModel.showLiveChat()),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedIconButton(
                        icon: Icons.speaker_notes_outlined,
                        label: "Game notes",
                        callback: () => viewModel.showNotes()),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedIconButton(
                        icon: Icons.list_alt,
                        label: "Active Games",
                        callback: () => viewModel.showGames()),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedIconButton(
                        icon: Icons.menu_open_rounded,
                        label: "Return to menu",
                        callback: () => viewModel.returnToMenu()),
                  ],
                ),
              ),
            ),
            if (viewModel.tabVisible == 0)
              const ChatBox(flex: 1)
            else if (viewModel.tabVisible == 1)
              const GameNotes(flex: 1)
            else if (viewModel.tabVisible == 2)
              const Text("Active Games")
          ],
        ),
      ),
    );
  }
}
