import 'package:stacked/stacked.dart';

class TabletextfieldHeaderViewModel extends BaseViewModel {
  late bool _showFilter = false;
  get showFilter => _showFilter;

  void filterSelected() {
    _showFilter = !_showFilter;
    notifyListeners();
  }

  valueChanged(String value, Function callback) {
    if (value.isEmpty) _showFilter = false;

    callback.call(value);

    notifyListeners();
  }
}
