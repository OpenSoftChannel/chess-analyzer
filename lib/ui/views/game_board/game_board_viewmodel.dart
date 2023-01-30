import 'package:chess/domain/models/board_square.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';

class GameboardViewModel extends BaseViewModel {
  late Color _whiteColor = ThemeColors.cardBackground;
  late Color _blackColor = ThemeColors.mainThemeBackground;

  GameboardViewModel(Color? whiteSquares, Color? blackSquares) {
    if (whiteSquares != null) _whiteColor = whiteSquares;
    if (blackSquares != null) _blackColor = blackSquares;
  }

  // ignore: prefer_final_fields
  List<BoardSquare> _squares = [];
  List<BoardSquare> get squares => _squares;

  ready() {
    _squares = BoardSquare.getBoard(_blackColor, _whiteColor);
  }
}
