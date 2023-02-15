import 'package:chess/infrastructure/ipage_router_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class AnalysisOptionPanelViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IPageRouterService _router;

  bool _isAdvantageOpen = true;
  bool get isAdvantageOpen => _isAdvantageOpen;
  bool _isTimeframeOpen = false;
  bool get isTimeframeOpen => _isTimeframeOpen;

  bool _isExportOpen = false;
  bool get isExportOpen => _isExportOpen;

  bool _isVariationsOpen = false;
  bool get isVaritationsOpen => _isVariationsOpen;

  ready() {
    _router = getIt.get<IPageRouterService>();
  }

  advantageOpen() {
    disableAll();
    _isAdvantageOpen = true;
    notifyListeners();
  }

  openTimeframe() {
    disableAll();
    _isTimeframeOpen = true;
    notifyListeners();
  }

  openExport() {
    disableAll();
    _isExportOpen = true;
    notifyListeners();
  }

  openVariations() {
    disableAll();
    _isVariationsOpen = true;
    notifyListeners();
  }

  disableAll() {
    _isAdvantageOpen = false;
    _isExportOpen = false;
    _isTimeframeOpen = false;
    _isVariationsOpen = false;
  }

  returnToParent() {
    _router.changePage("/active-game");
  }
}
