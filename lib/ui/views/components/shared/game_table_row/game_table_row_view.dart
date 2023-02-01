import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:chess/ui/views/components/shared/player_game_card/player_game_card_view.dart';
import 'package:flutter/material.dart';

import '../../../../../Assets/styles.dart';
import '../card_component.dart';

// ignore: must_be_immutable
class GameTableRow extends StatelessWidget {
  late String? whiteImageSource;
  late String? whiteName;
  late String? whiteOpening;
  late String? whiteElo;
  late String? blackImageSource;

  late String? blackName;
  late String? blackOpening;
  late String? blackElo;
  late String? date;
  late String? score;

  GameTableRow({
    super.key,
    this.whiteImageSource,
    this.whiteOpening,
    this.whiteName,
    this.whiteElo,
    this.blackImageSource,
    this.blackName,
    this.blackOpening,
    this.blackElo,
    this.date,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      render: Row(
        children: [
          Expanded(
            flex: 2,
            child: PlayerGameCard(
              name: whiteName,
              elo: whiteElo,
              opening: whiteOpening,
              imageSource: whiteImageSource,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: PlayerGameCard(
              name: blackName,
              elo: blackElo,
              opening: blackOpening,
              imageSource: blackImageSource,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              date ?? "--",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              score ?? "--",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
