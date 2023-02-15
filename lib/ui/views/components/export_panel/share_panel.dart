import 'package:chess/ui/views/components/shared/IconButton/elevated_icon_button.dart';
import 'package:chess/ui/views/components/shared/card_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/Assets/styles.dart';

class SharePanel extends StatelessWidget {
  const SharePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Share your game",
          style: TextStyle(color: ThemeColors.mainText),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Image.network(
            "https://camo.githubusercontent.com/ce63c19d41524780a8554ab2451fb512656acf56356868e5a62fc13ef6e11d14/68747470733a2f2f692e696d6775722e636f6d2f645871724949592e676966",
            height: 180,
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedIconButton(
              icon: Icons.facebook,
              label: "",
            ),
            ElevatedIconButton(
              faIcon: FaIcon(
                FontAwesomeIcons.twitch,
                size: GeneralTheme.btnIconSize,
              ),
              label: "",
            ),
            ElevatedIconButton(
              faIcon: FaIcon(
                FontAwesomeIcons.twitter,
                size: GeneralTheme.btnIconSize,
              ),
              label: "",
            ),
            ElevatedIconButton(
              faIcon: FaIcon(
                FontAwesomeIcons.instagram,
                size: GeneralTheme.btnIconSize,
              ),
              label: "",
            ),
            ElevatedIconButton(
              icon: Icons.html,
              label: "",
            )
          ],
        ),
        //TODO Replace with a custom GIF generator from the chess analyzer
      ],
    );
  }
}
