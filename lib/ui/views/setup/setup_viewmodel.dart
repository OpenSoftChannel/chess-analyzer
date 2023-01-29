import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:chess/Assets/styles.dart';
import 'package:duration_picker_dialog_box/duration_picker_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../application/router.gr.dart';
import '../../../infrastructure/iadvertisment.dart';
import '../../../infrastructure/ipage_router_service.dart';

class SetupViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router;
  late BuildContext _context;
  late IAdvertisment _advertisment;

  late int? _minutes = 0;
  late int? _increment = 0;

  late bool _showWhiteNameFilter = false;
  bool get showWhiteNameFilter => _showWhiteNameFilter;

  late bool _showBlackFilterName = false;
  get showBlackFilterName => _showBlackFilterName;

  late bool _showDatePicker = false;
  get showDatePicker => _showDatePicker;

  DateTime? _from;
  DateTime? _to;

  late bool _showScorePicker = false;
  bool get showScorePicker => _showScorePicker;

  late int _whiteWin = 0;
  late int _blackWin = 0;
  int get whiteWin => _whiteWin;
  int get blackWin => _blackWin;

  void initialise(BuildContext context) async {
    router = getIt.get<IPageRouterService>();
    _advertisment = getIt.get<IAdvertisment>();
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
    await _advertisment.interstitialAd.show();
    await _advertisment.loadAd();
    var minutes = _minutes ?? 5;
    var increment = _increment ?? 0;

    router.router.navigate(PlaytimerView(
      minutes: minutes,
      increment: increment,
    ));
  }

  void nameFilterSelected() {
    _showWhiteNameFilter = !_showWhiteNameFilter;
    notifyListeners();
  }

  void whiteFilterChanged(String value) {
    if (value.isEmpty) _showWhiteNameFilter = false;

    notifyListeners();
  }

  void blackFilterChanged(String value) {
    if (value.isEmpty) _showBlackFilterName = false;

    notifyListeners();
  }

  void nameBlackFilterSelected() {
    _showBlackFilterName = !_showBlackFilterName;
    notifyListeners();
  }

  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];
  dateFilterSelected(BuildContext context) async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
          firstDayOfWeek: 1,
          calendarType: CalendarDatePicker2Type.range,
          selectedDayTextStyle: TextStyle(
              color: ThemeColors.mainText, fontWeight: FontWeight.w700),
          selectedDayHighlightColor: ThemeColors.cardBackground,
          disabledDayTextStyle: TextStyle(
            color: ThemeColors.innerText,
          )),
      initialValue: [],
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    );

    if (results != null) {
      _from = results.first;
      _to = results.last;
    }

    //TODO add the filtering call
    var test = "Ok";
  }

  void scorePickerSelected() {
    _showScorePicker = !_showScorePicker;
    notifyListeners();
  }

  void whiteScoreChanged(int value) {}

  void blackScoreChanged(int value) {}

  void incrementButton(int type) {
    if (type == 0) {
      _whiteWin += 1;
    } else {
      _blackWin += 1;
    }
    notifyListeners();
  }

  decrementButton(int type) {
    if (type == 0) {
      _whiteWin = _whiteWin < 1 ? 0 : _whiteWin - 1;
    } else {
      _blackWin = _blackWin < 1 ? 0 : _blackWin - 1;
    }

    checkFilterDisposed();
    notifyListeners();
  }

  void checkFilterDisposed() {
    if (_whiteWin == 0 && blackWin == 0) {
      _showScorePicker = false;
      notifyListeners();
    }
  }
}
