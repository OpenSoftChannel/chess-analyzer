import 'package:stacked/stacked.dart';

class GameTableViewModel extends BaseViewModel {
  // ignore: unused_field
  late DateTime? _from;
  // ignore: unused_field
  late DateTime? _to;

  void whiteFilterChanged(String value) {
    notifyListeners();
  }

  void blackFilterChanged(String value) {
    notifyListeners();
  }

  dateFilterSelected(List<DateTime?>? dates) {
    if (dates != null) {
      _from = dates.first;
      _to = dates.last;
    }
  }

  scoreFilter(int white, int black) {
    //TODO apply filters
  }
}
