import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';

class HorizontalScoreIndicator extends StatelessWidget {
  const HorizontalScoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 99,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                ),
                color: ThemeColors.mainText,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: ThemeColors.cardBackground,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
                color: ThemeColors.mainThemeBackground,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: ThemeColors.mainText,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
