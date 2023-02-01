import 'package:chess/infrastructure/ipage_router_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class ActiveGamePropertiesPanelViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IPageRouterService _router;

  int _tabVisible = 0;
  int get tabVisible => _tabVisible;

  ready() {
    _router = getIt.get<IPageRouterService>();
  }

  showLiveChat() {
    _tabVisible = 0;

    notifyListeners();
  }

  showNotes() {
    _tabVisible = 1;
    notifyListeners();
  }

  showGames() {
    _tabVisible = 2;
    notifyListeners();
  }

  returnToMenu() {
    _router.changePage("/");
  }
}
