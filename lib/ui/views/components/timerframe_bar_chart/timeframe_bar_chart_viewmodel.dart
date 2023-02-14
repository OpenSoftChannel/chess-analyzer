import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:stacked/stacked.dart';

class TimeframeBarChartViewModel extends BaseViewModel {
  // ignore: unused_field
  double? _mouseX;
  double? get mouseX => _mouseX;
  // ignore: unused_field
  double? _mouseY;
  double? get mouseY => _mouseY;

  DummyBarSelected? _barSelected;
  DummyBarSelected? get selectedItem => _barSelected;

  late List<DummyBarData> _chartData = [];

  List<DummyBarData> get chartData => _chartData;

  bool _itemHovered = false;
  bool get itemHovered => _itemHovered;

  MouseCursor _isCursorVisible = SystemMouseCursors.basic;
  MouseCursor get isCursorVisible => _isCursorVisible;

  //TODO add bindings
  whiteBarHoverEnter(int move, double time) {
    _barSelected = DummyBarSelected(move: move, time: time);
    _isCursorVisible = SystemMouseCursors.none;
    _itemHovered = true;
    notifyListeners();
  }

  whiteBarHoverExit(DummyBarData e) {
    _itemHovered = false;
    _isCursorVisible = SystemMouseCursors.basic;
    notifyListeners();
  }

  blackBarHoverEnter(int move, double time) {
    _barSelected = DummyBarSelected(move: move, time: time);
    _isCursorVisible = SystemMouseCursors.none;
    _itemHovered = true;
    notifyListeners();
  }

  blackBarHoverExit(DummyBarData e) {
    _itemHovered = false;
    _isCursorVisible = SystemMouseCursors.basic;
    notifyListeners();
  }

  mousePositionChanged(PointerHoverEvent pointer) {
    _mouseX = pointer.localPosition.dx;
    _mouseY = pointer.localPosition.dy;
  }

  double getElementHeight(DummyBarData e) {
    return e.whiteTime + e.blackTime * 10 + 50;
  }

  ready() {
    //TODO Replace dummy data with widget query once the data layer is complete

    List<DummyBarData> barChartDummyData = [];

    for (var i = 1; i < 12; i++) {
      var rng = Random();
      var maxVal = 20;
      var minVal = 3;
      var white = rng.nextInt(maxVal - minVal);
      var black = rng.nextInt(maxVal - minVal);
      if (white < minVal || white > maxVal) {
      } else if (black < minVal || black > maxVal) {
      } else {
        barChartDummyData.add(DummyBarData(
            blackTime: black.toDouble(), whiteTime: white.toDouble(), move: i));
      }
    }

    _chartData = barChartDummyData;
    notifyListeners();
  }
}

class DummyBarData {
  late double whiteTime;
  late double blackTime;
  late int move;

  DummyBarData(
      {required this.blackTime, required this.whiteTime, required this.move});
}

class DummyBarSelected {
  late int move;
  late double time;

  DummyBarSelected({required this.move, required this.time});
}
