import 'package:stacked/stacked.dart';

class TableHeaderScorePickerViewModel extends BaseViewModel {
  late bool _showScorePicker = false;
  bool get showScorePicker => _showScorePicker;

  late int _whiteWin = 0;
  late int _blackWin = 0;
  late Function _callback;
  ready(Function callback) {
    _callback = callback;
  }

  void scorePickerSelected() {
    _showScorePicker = !_showScorePicker;
    notifyListeners();
  }

  void checkFilterDisposed() {
    if (_whiteWin == 0 && _blackWin == 0) {
      _showScorePicker = false;
      notifyListeners();
    }

    _callback.call(_whiteWin, _blackWin);
  }

  whiteValueChanged(int value) {
    _whiteWin = value;
    checkFilterDisposed();
  }

  blackValueChanged(int value) {
    _blackWin = value;
    checkFilterDisposed();
  }
}
