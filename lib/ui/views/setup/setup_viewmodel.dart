import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/ipage_router_service.dart';

class SetupViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router;
  late BuildContext _context;

  void initialise(BuildContext context) async {
    router = getIt.get<IPageRouterService>();
    _context = context;
    notifyListeners();
  }
}
