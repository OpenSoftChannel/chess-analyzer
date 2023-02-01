import 'package:flutter/material.dart';
import '../../../../../Assets/styles.dart';
import '../card_component.dart';

// ignore: must_be_immutable
class TableMoveRow extends StatelessWidget {
  late Function callback;
  late String move;
  late String? whitePlay;
  late String? blackPlay;

  TableMoveRow({
    super.key,
    required this.callback,
    required this.move,
    this.whitePlay,
    this.blackPlay,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      render: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: ThemeColors.mainThemeBackground,
            child: Text(
              move,
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              whitePlay ?? "",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              blackPlay ?? "",
              style: TextStyle(color: ThemeColors.mainText),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
