import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:progresso/progresso.dart';

import '../../../../domain/Assets/styles.dart';
import '../shared/player_game_card/player_game_card_view.dart';

//TODO Address the issue with this component, when changing resolution it causes the application to freeze because of draw overflow.
class PlayerSessionPanel extends StatelessWidget {
  const PlayerSessionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 300, child: PlayerGameCard()),
        const Expanded(
          child: Text(""),
        ),
        Column(
          children: [
            Center(
              child: Text(
                "05:16",
                style: TextStyle(color: ThemeColors.mainText, fontSize: 60),
              ),
            ),
            SizedBox(
              width: 150,
              child: Progresso(
                backgroundColor: ThemeColors.innerText,
                progress: 0.5,
                progressStrokeCap: StrokeCap.round,
                backgroundStrokeCap: StrokeCap.round,
              ),
            )
          ],
        )
      ],
    );
  }
}
