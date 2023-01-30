import 'package:duration_picker_dialog_box/duration_picker_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/router.gr.dart';
import '../../../../infrastructure/ipage_router_service.dart';

class GameSettingsPanelviewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router;
  late BuildContext _context;

  late int? _minutes = 0;
  late int? _increment = 0;

  void initialise(BuildContext context) async {
    router = getIt.get<IPageRouterService>();
    _context = context;

    notifyListeners();
  }

  intervalPicker() async {
    await showDurationPicker(
      context: _context,
      initialDuration: const Duration(),
      durationPickerMode: DurationPickerMode.Minute,
      showHead: false,
    ).then((value) => {_minutes = value!.inMinutes});
  }

  selectIncrementInterval() async {
    await showDurationPicker(
      context: _context,
      initialDuration: const Duration(),
      durationPickerMode: DurationPickerMode.Second,
      showHead: false,
    ).then((value) => {_increment = value!.inSeconds});
  }

  beginGame() async {
    var minutes = _minutes ?? 5;
    var increment = _increment ?? 0;

    router.router.navigate(PlaytimerView(
      minutes: minutes,
      increment: increment,
    ));
  }
}