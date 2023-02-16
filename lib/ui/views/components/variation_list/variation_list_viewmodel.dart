import 'package:stacked/stacked.dart';

class VariationListViewModel extends BaseViewModel {
  List<DummyVariationData> _variationsData = [
    DummyVariationData(index: 1),
    DummyVariationData(index: 2),
    DummyVariationData(index: 3),
  ];

  List<DummyVariationData> get variationsData => _variationsData;

  variationSelected(int index) {
    print(index);

    var element =
        _variationsData.firstWhere((element) => element.index == index);
    element.isOpen = !element.isOpen;

    notifyListeners();
  }
}

class DummyVariationData {
  final int index;
  late bool isOpen;

  DummyVariationData({required this.index, this.isOpen = false});
}
