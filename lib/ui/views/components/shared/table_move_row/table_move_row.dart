import 'package:badges/badges.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
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
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ThemeColors.mainThemeBackground,
                  border: Border.all(
                    color: ThemeColors.mainText,
                    width: 1,
                  ),
                  shape: BoxShape.circle),
              child: Text(
                move,
                style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Badge(
                  badgeContent: Icon(
                    Icons.question_mark_outlined,
                    color: ThemeColors.mainText,
                    size: 12,
                  ),
                  position: BadgePosition.topEnd(end: -30),
                  badgeStyle:
                      BadgeStyle(badgeColor: ThemeColors.inaccuracieColor),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeColors.mainText,
                      border: Border.all(
                          color: ThemeColors.cardBackground, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.castle,
                            color: ThemeColors.cardBackground,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            whitePlay ?? "",
                            style: TextStyle(color: ThemeColors.cardBackground),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Badge(
                  badgeContent: Icon(
                    Icons.question_mark_outlined,
                    color: ThemeColors.mainText,
                    size: 12,
                  ),
                  position: BadgePosition.topEnd(end: -30),
                  badgeStyle:
                      BadgeStyle(badgeColor: ThemeColors.inaccuracieColor),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeColors.mainText,
                      border: Border.all(
                          color: ThemeColors.cardBackground, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WhiteQueen(
                            fillColor: ThemeColors.cardBackground,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            blackPlay ?? "",
                            style: TextStyle(color: ThemeColors.cardBackground),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
