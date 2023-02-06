import 'package:badges/badges.dart' as Badges;
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../domain/Assets/styles.dart';

class MaterialPanel extends StatelessWidget {
  final bool isWhite;

  const MaterialPanel({super.key, required this.isWhite});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Badges.Badge(
          badgeStyle:
              Badges.BadgeStyle(badgeColor: ThemeColors.defaultBtnColor),
          badgeContent: Text(
            "8",
            style: TextStyle(
              color: ThemeColors.mainText,
            ),
          ),
          child: WhitePawn(
            size: 55,
            fillColor: isWhite ? ThemeColors.mainText : ThemeColors.innerText,
          ),
        ),
        Badges.Badge(
          badgeStyle:
              Badges.BadgeStyle(badgeColor: ThemeColors.defaultBtnColor),
          badgeContent: Text(
            "2",
            style: TextStyle(
              color: ThemeColors.mainText,
            ),
          ),
          child: WhiteBishop(
            size: 55,
            fillColor: isWhite ? ThemeColors.mainText : ThemeColors.innerText,
          ),
        ),
        Badges.Badge(
          badgeStyle:
              Badges.BadgeStyle(badgeColor: ThemeColors.defaultBtnColor),
          badgeContent: Text(
            "2",
            style: TextStyle(
              color: ThemeColors.mainText,
            ),
          ),
          child: WhiteKnight(
            size: 55,
            fillColor: isWhite ? ThemeColors.mainText : ThemeColors.innerText,
          ),
        ),
        Badges.Badge(
          badgeStyle:
              Badges.BadgeStyle(badgeColor: ThemeColors.defaultBtnColor),
          badgeContent: Text(
            "2",
            style: TextStyle(
              color: ThemeColors.mainText,
            ),
          ),
          child: WhiteRook(
            size: 55,
            fillColor: isWhite ? ThemeColors.mainText : ThemeColors.innerText,
          ),
        ),
        Badges.Badge(
          badgeStyle:
              Badges.BadgeStyle(badgeColor: ThemeColors.defaultBtnColor),
          badgeContent: Text(
            "1",
            style: TextStyle(
              color: ThemeColors.mainText,
            ),
          ),
          child: WhiteQueen(
            size: 55,
            fillColor: isWhite ? ThemeColors.mainText : ThemeColors.innerText,
          ),
        ),
      ],
    );
  }
}
