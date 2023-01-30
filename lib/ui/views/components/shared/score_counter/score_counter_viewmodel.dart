import 'package:stacked/stacked.dart';

class ScoreCounterViewModel extends BaseViewModel {
  late Function _callback;
  late int _score = 0;
  int get score => _score;

  ready(Function callback) {
    _callback = callback;
  }

  incrementButton() {
    _score += 1;
    _callback.call(_score);

    notifyListeners();
  }

  decrementButton() {
    _score = _score < 1 ? 0 : _score - 1;
    _callback.call(_score);

    notifyListeners();
  }
}
