import 'package:auto_route/auto_route.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter/gestures.dart';
import 'package:stacked/stacked.dart';

class LineChartViewModel extends BaseViewModel {
  final List<int> _chartTestData = [
    5,
    4,
    3,
    7,
    6,
    2,
    5,
    4,
    1,
    3,
    4,
    2,
    7,
    6,
    2,
    5,
    4,
    1,
    3,
    4,
    2,
    7,
    6,
    2,
    5,
    4
  ];
  List<int> get chartTestData => _chartTestData;
  // ignore: unused_field
  double? _mouseX;
  double? get mouseX => _mouseX;
  // ignore: unused_field
  double? _mouseY;
  double? get mouseY => _mouseY;
  bool _isInRegion = false;
  bool get isInRegion => _isInRegion;

  int _popUpIndex = 0;
  int get popUpIndex => _popUpIndex;

  onHover(PointerHoverEvent pointer) {
    _mouseX = pointer.localPosition.dx;
    _mouseY = pointer.localPosition.dy;
    notifyListeners();
  }

  enablePopup(ItemBuilderData value) {
    //TODO get the item
    _popUpIndex = value.itemIndex;
    _isInRegion = true;
    notifyListeners();
  }

  disablePopup() {
    _isInRegion = false;
    notifyListeners();
  }
}
