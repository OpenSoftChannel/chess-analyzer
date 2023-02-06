import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../domain/Assets/styles.dart';

// ignore: must_be_immutable
class GameAccuracySlider extends StatelessWidget {
  late int white;
  late int black;

  GameAccuracySlider({super.key, required this.white, required this.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: black,
          child: Container(
            color: ThemeColors.mainText,
            child: const Opacity(
              opacity: 0,
              child: Text("slider"),
            ),
          ),
        ),
        Expanded(
          flex: white,
          child: Container(
            color: ThemeColors.mainThemeBackground,
            child: const Opacity(
              opacity: 0,
              child: Text("slider"),
            ),
          ),
        )
      ],
    );
  }
}
