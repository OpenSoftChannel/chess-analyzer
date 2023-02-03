import 'package:chess/infrastructure/ipage_router_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class PlayActionTableViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IPageRouterService _router;

  bool _gameEnded = false;
  bool get gameEnded => _gameEnded;

  ready() {
    _router = getIt.get<IPageRouterService>();
  }

  triggerEnd() {
    _gameEnded = !_gameEnded;
    notifyListeners();
  }

  openAnalistys() {
    _router.changePage("/analysis-board");
  }
}
