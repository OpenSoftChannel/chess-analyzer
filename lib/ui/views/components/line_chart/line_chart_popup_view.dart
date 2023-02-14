import 'package:flutter/material.dart';
import '../../../../domain/Assets/styles.dart';

// ignore: must_be_immutable
class LineChartPopup extends StatelessWidget {
  late String line;
  late String move;
  late String advantage;

  LineChartPopup(
      {super.key,
      required this.line,
      required this.advantage,
      required this.move});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$line. Move $move",
              style: TextStyle(
                color: ThemeColors.mainText,
                fontSize: 15,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Advantage: $advantage",
              style: TextStyle(
                color: ThemeColors.mainText,
                fontSize: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}
