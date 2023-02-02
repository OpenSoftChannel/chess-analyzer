import 'package:badges/badges.dart';
import 'package:chess/Assets/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabButton extends StatelessWidget {
  final IconData? icon;
  late double? iconSize;
  final String? label;
  final int? badgeCount;
  final Function callback;
  late bool isActive;

  TabButton({
    super.key,
    required this.iconSize,
    required this.callback,
    required this.isActive,
    this.badgeCount,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: isActive ? ThemeColors.mainText : ThemeColors.cardBackground,
      child: InkWell(
        onTap: () => callback.call(),
        child: Visibility(
          visible: badgeCount != null,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                  visible: icon != null,
                  child: GeneralTheme.tableHeaderIcon(
                    icon!,
                    iconSize ?? 0,
                    isActive
                        ? ThemeColors.cardBackground
                        : ThemeColors.mainText,
                  )),
              const SizedBox(
                width: 5,
              ),
              Visibility(
                visible: label != null,
                child: Text(
                  label!,
                  style: TextStyle(
                    color: isActive
                        ? ThemeColors.cardBackground
                        : ThemeColors.mainText,
                    fontSize: (iconSize! - 1),
                  ),
                ),
              ),
            ],
          ),
          child: Badge(
            badgeStyle: BadgeStyle(
              badgeColor:
                  isActive ? ThemeColors.cardBackground : ThemeColors.mainText,
            ),
            ignorePointer: true,
            position: BadgePosition.topEnd(top: 1),
            badgeAnimation: const BadgeAnimation.fade(
              toAnimate: true,
              loopAnimation: true,
              animationDuration: Duration(seconds: 2),
              curve: Curves.easeIn,
            ),
            badgeContent: Text(
              badgeCount.toString(),
              style: TextStyle(
                fontSize: 8,
                color: isActive
                    ? ThemeColors.mainText
                    : ThemeColors.cardBackground,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                    visible: icon != null,
                    child: GeneralTheme.tableHeaderIcon(
                      icon!,
                      iconSize ?? 0,
                      isActive
                          ? ThemeColors.cardBackground
                          : ThemeColors.mainText,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: label != null,
                  child: Text(
                    label!,
                    style: TextStyle(
                      color: isActive
                          ? ThemeColors.cardBackground
                          : ThemeColors.mainText,
                      fontSize: (iconSize! - 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
