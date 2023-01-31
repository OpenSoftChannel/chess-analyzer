import 'dart:math';

import 'package:chess/domain/models/board_square.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:draw_your_image/draw_your_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';

class GameboardViewModel extends BaseViewModel {
  late Color _whiteColor = ThemeColors.cardBackground;
  late Color _blackColor = ThemeColors.mainThemeBackground;

  late bool _drawing = false;
  get canDraw => _drawing;
  DrawController? _controller;
  DrawController? get drawController => _controller;

  GameboardViewModel(Color? whiteSquares, Color? blackSquares) {
    if (whiteSquares != null) _whiteColor = whiteSquares;
    if (blackSquares != null) _blackColor = blackSquares;
  }

  ready() {
    _squares = BoardSquare.getBoard(_blackColor, _whiteColor);
    _squares.first.occupied = WhiteKing();
    notifyListeners();
  }

  // ignore: prefer_final_fields
  List<BoardSquare> _squares = [];
  List<BoardSquare> get squares => _squares;

  void figureDropped(Object? current) {
    var test = "";
  }

  dragStarted(String rowLabel) {
    notifyListeners();
  }

  dragUpdated(DragUpdateDetails details) {
    //  print(details.localPosition);
  }

  enabledDraw() {
    _controller?.clear();
    _drawing = true;
    notifyListeners();
  }

  disableDraw() {
    _drawing = false;
    notifyListeners();
  }
}
