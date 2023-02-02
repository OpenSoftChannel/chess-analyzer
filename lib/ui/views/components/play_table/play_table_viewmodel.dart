import 'package:stacked/stacked.dart';

class PlayActionTableViewModel extends BaseViewModel {
  bool _gameEnded = false;
  bool get gameEnded => _gameEnded;

  triggerEnd() {
    _gameEnded = !_gameEnded;
    notifyListeners();
  }
}
