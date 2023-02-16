import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:chess/ui/views/components/variation_list/variation_list_view.dart';
import 'package:chess/ui/views/game_board/game_board_view.dart';
import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';
import '../player_variations_list/player_variations_list_view.dart';

class VariationsPanel extends StatelessWidget {
  const VariationsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: ThemeColors.cardBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedIconButton(
                      label: "Best Moves",
                      icon: Icons.star,
                      btnFontColor: ThemeColors.mainText,
                      btnIconFontColor: ThemeColors.mainText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedIconButton(
                      label: "Worst Moves",
                      icon: Icons.warning,
                      btnFontColor: ThemeColors.mainText,
                      btnIconFontColor: ThemeColors.mainText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedIconButton(
                      label: "Elo Score",
                      icon: Icons.arrow_downward,
                      btnFontColor: ThemeColors.mainText,
                      btnIconFontColor: ThemeColors.mainText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedIconButton(
                      label: "Elo Score",
                      icon: Icons.arrow_upward,
                      btnFontColor: ThemeColors.mainText,
                      btnIconFontColor: ThemeColors.mainText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedIconButton(
                      label: "Date Range",
                      icon: Icons.date_range_outlined,
                      btnFontColor: ThemeColors.mainText,
                      btnIconFontColor: ThemeColors.mainText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Visibility(
                        visible: MediaQuery.of(context).size.width > 1920,
                        child: Expanded(flex: 10, child: Text(""))),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        cursorColor: ThemeColors.mainText,
                        style: TextStyle(color: ThemeColors.mainText),
                        decoration: InputDecoration(
                          fillColor: ThemeColors.cardBackground,
                          border: const OutlineInputBorder(),
                          filled: true,
                          labelStyle: TextStyle(color: ThemeColors.mainText),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeColors.mainText,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: ThemeColors.innerText,
                          )),
                          focusColor: ThemeColors.mainText,
                          labelText: "Search by player name",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  color: ThemeColors.mainThemeBackground,
                  padding: const EdgeInsets.all(20),
                  child: const VariationList(),
                ),
              ),
            ],
          ),
        ),
        const Expanded(flex: 1, child: PlayerVariationsList()),
        const Expanded(flex: 1, child: GameBoard(aspectRationModifier: 0.55))
      ],
    );
  }
}
