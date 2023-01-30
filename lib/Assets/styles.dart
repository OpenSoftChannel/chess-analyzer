import 'package:flutter/material.dart';

class ThemeColors {
  static Color mainText = const Color.fromRGBO(188, 200, 215, 1.0);
  static Color innerText = const Color.fromRGBO(82, 95, 105, 1.0);
  static Color activeMenu = Colors.redAccent;
  static Color mainThemeBackground = const Color.fromRGBO(30, 30, 38, 1);
  static Color cardBackground = const Color.fromRGBO(40, 41, 49, 1);
}

class GeneralTheme {
  static BorderRadius mainRounding = const BorderRadius.all(Radius.circular(5));
  static EdgeInsets boxPadding = const EdgeInsets.fromLTRB(10, 10, 10, 10);
  static EdgeInsets boxMargin = const EdgeInsets.fromLTRB(5, 5, 5, 5);
  static EdgeInsets rowTopMargin = const EdgeInsets.fromLTRB(0, 5, 0, 0);
  static EdgeInsets rowInnerTopMargin = const EdgeInsets.fromLTRB(0, 10, 0, 0);
  static TextStyle setupP = TextStyle(
    color: ThemeColors.innerText,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.italic,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static TextStyle setuph1 = TextStyle(
      color: ThemeColors.mainText,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.italic,
      fontSize: 25,
      fontWeight: FontWeight.bold);

  static TextStyle gridHeaderStyle = TextStyle(
    color: ThemeColors.mainText,
    fontSize: 15,
  );

  static InputDecoration inputDecoration = InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: ThemeColors.mainText, width: 1, style: BorderStyle.solid),
    ),
    labelStyle: TextStyle(color: ThemeColors.mainText),
    fillColor: ThemeColors.mainText,
    focusColor: ThemeColors.mainText,
    filled: false,
    border: UnderlineInputBorder(
      borderSide: BorderSide(
          color: ThemeColors.mainText, width: 1, style: BorderStyle.solid),
    ),
  );

  static TextStyle inputDecorationText =
      TextStyle(color: ThemeColors.mainText, fontSize: 20);

  static Icon tableHeaderIcon(IconData icon) {
    return Icon(
      icon,
      color: ThemeColors.mainText,
      size: 50,
    );
  }
}
