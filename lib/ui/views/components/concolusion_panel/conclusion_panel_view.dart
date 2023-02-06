import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';

class ConclusionPanel extends StatelessWidget {
  const ConclusionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
    return Row(
      children: [
        Column(
          children: [
            Text(
              "--",
              style: TextStyle(
                color: ThemeColors.mainText,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Accuracy",
              style: TextStyle(
                color: ThemeColors.mainText,
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1, // width ÷ height
                valueNotifier: _valueNotifier,
                progress: 85,
                maxProgress: 100,
                corners: StrokeCap.butt,
                foregroundColor: Colors.blue,
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 3,
                backgroundStrokeWidth: 2,
                animation: true,
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) => Text('${value.toInt()}%',
                        style: TextStyle(color: ThemeColors.mainText)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "1",
                  style: TextStyle(
                    color: ThemeColors.inaccuracieColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 5),
                Text(
                  "inaccuracies",
                  style: TextStyle(
                    color: ThemeColors.inaccuracieColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "1",
                  style: TextStyle(
                    color: ThemeColors.mistakeColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 5),
                Text(
                  "Mistakes",
                  style: TextStyle(
                    color: ThemeColors.mistakeColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "1",
                  style: TextStyle(
                    color: ThemeColors.defaultBtnColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 5),
                Text(
                  "Blunders",
                  style: TextStyle(
                    color: ThemeColors.defaultBtnColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "76",
                  style: TextStyle(
                    color: ThemeColors.mainText,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 5),
                Text(
                  "Average centipawn loss",
                  style: TextStyle(
                    color: ThemeColors.mainText,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        )
      ],
    );
  }
}
