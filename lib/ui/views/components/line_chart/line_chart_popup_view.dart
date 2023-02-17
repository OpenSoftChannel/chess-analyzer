import 'package:flutter/material.dart';
import '../../../../domain/Assets/styles.dart';

// ignore: must_be_immutable
class LineChartPopup extends StatelessWidget {
  late String line;
  late String move;
  late String advantage;
  late Color color;
  late double transform;

  LineChartPopup(
      {super.key,
      required this.line,
      required this.advantage,
      required this.move,
      required this.color,
      required this.transform});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(transform),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$line. Move $move",
                style: TextStyle(
                  color: color,
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
                  color: color,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
