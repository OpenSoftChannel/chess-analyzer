import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/ipage_router_service.dart';

class ActiveGameViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IPageRouterService _router;

  bool _gameEnded = false;
  bool get gameEnded => _gameEnded;

  initialise(BuildContext context) {
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
