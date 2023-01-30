import 'package:flutter/material.dart';

import '../../../../../Assets/styles.dart';

// ignore: must_be_immutable
class ElevatedIconButton extends StatelessWidget {
  Function? callback;
  Color? btnBackground;
  Color? btnIconFontColor;
  Color? btnFontColor;
  double? btnIconFontSize;
  double? btnTextFontSize;

  String label;
  IconData? icon;

  ElevatedIconButton({
    super.key,
    this.callback,
    this.btnBackground,
    this.btnIconFontColor,
    this.btnFontColor,
    this.btnIconFontSize,
    this.btnTextFontSize,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() => callback?.call()),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => btnBackground ?? ThemeColors.defaultBtnColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: Icon(icon,
                color: btnIconFontColor ?? ThemeColors.defaultBtnTextColor,
                size: btnIconFontSize ?? GeneralTheme.btnIconSize),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(
                color: btnFontColor ?? ThemeColors.defaultBtnTextColor,
                fontSize: btnTextFontSize ?? GeneralTheme.btnTextSize),
          ),
        ],
      ),
    );
  }
}
