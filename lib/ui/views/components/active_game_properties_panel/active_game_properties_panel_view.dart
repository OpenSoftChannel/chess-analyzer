import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:chess/ui/views/components/active_game_properties_panel/active_game_properties_panel_viewmodel.dart';
import 'package:chess/ui/views/components/chat_box/chat_box_view.dart';
import 'package:chess/ui/views/components/game_list/game_list_view.dart';
import 'package:chess/ui/views/components/game_notes/game_notes_view.dart';
import 'package:chess/ui/views/components/shared/tab_buton/tab_button_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Assets/styles.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TabButton(
                        icon: Icons.chat,
                        iconSize: 15,
                        label: "Live chat",
                        isActive: viewModel.chatActive,
                        callback: () => viewModel.showLiveChat()),
                  ),
                  Expanded(
                    child: TabButton(
                        icon: Icons.speaker_notes_outlined,
                        iconSize: 15,
                        label: "Game notes",
                        isActive: viewModel.notesActive,
                        callback: () => viewModel.showNotes()),
                  ),
                  Expanded(
                    child: TabButton(
                        icon: Icons.list_alt,
                        iconSize: 15,
                        label: "Active Games",
                        badgeCount: 25,
                        isActive: viewModel.gamesActive,
                        callback: () => viewModel.showGames()),
                  ),
                  Expanded(
                    child: TabButton(
                        icon: Icons.menu_open_rounded,
                        iconSize: 15,
                        label: "Return to menu",
                        isActive: viewModel.backToMenuActive,
                        callback: () => viewModel.returnToMenu()),
                  ),
                ],
              ),
            ),
            if (viewModel.tabVisible == 0)
              const ChatBox(flex: 1)
            else if (viewModel.tabVisible == 1)
              const GameNotes(flex: 1)
            else if (viewModel.tabVisible == 2)
              GameList(flex: 1)
          ],
        ),
      ),
    );
  }
}
