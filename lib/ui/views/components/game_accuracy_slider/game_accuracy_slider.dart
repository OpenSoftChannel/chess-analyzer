import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';

// ignore: must_be_immutable
class GameAccuracySlider extends StatelessWidget {
  late int? move;
  late double white;
  late double black;
  final double rounding;
  late Function? onWhiteHoverEnter;
  late Function? onWhiteHoverExit;
  late Function? onBlackHoverEnter;
  late Function? onBlackHoverExit;

  GameAccuracySlider({
    super.key,
    this.move = 0,
    required this.white,
    required this.black,
    required this.rounding,
    this.onWhiteHoverEnter,
    this.onWhiteHoverExit,
    this.onBlackHoverEnter,
    this.onBlackHoverExit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: ((white / black * 100).toInt()),
          child: MouseRegion(
            onEnter: (event) => onWhiteHoverEnter?.call(move, white) ?? {},
            onExit: (event) => onWhiteHoverExit?.call() ?? {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(rounding),
                    topRight: Radius.circular(rounding)),
                color: ThemeColors.mainText,
              ),
              child: const Opacity(
                opacity: 0,
                child: Text("slider"),
              ),
            ),
          ),
        ),
        Expanded(
          flex: (black / white * 100).toInt(),
          child: MouseRegion(
            onEnter: (event) =>
                onBlackHoverEnter?.call(
                  move,
                  black,
                ) ??
                {},
            onExit: (event) => onBlackHoverExit?.call() ?? {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(rounding),
                    bottomRight: Radius.circular(rounding)),
                color: ThemeColors.cardBackground,
              ),
              child: const Opacity(
                opacity: 0,
                child: Text("slider"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
