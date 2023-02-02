import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Assets/styles.dart';

class ChatBoxViewModel extends BaseViewModel {
  List<bool> _chatSession = [true, false, false, true];
  List<bool> get chatSession => _chatSession;

  String _message = "";

  late final TextEditingController _inputController = TextEditingController();
  get inputController => _inputController;

  Color _textFieldSelected = ThemeColors.mainThemeBackground;
  get textFieldSelected => _textFieldSelected;

  Color _textInputFontColor = ThemeColors.mainText;
  get textInputFontColor => _textInputFontColor;

  focusChanged(bool value) {
    if (value) {
      _textFieldSelected = ThemeColors.mainText;
      _textInputFontColor = ThemeColors.mainThemeBackground;
    } else {
      _textFieldSelected = ThemeColors.mainThemeBackground;
      _textInputFontColor = ThemeColors.mainText;
    }
  }

  chatBoxChanged(String value) {
    _message = value;
  }

  chatBoxSubmitted(String value) {
    _chatSession.add(_message.length.isEven);
    _inputController.clear();
    notifyListeners();
  }
}
