import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../domain/Assets/styles.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool tail;
  final bool isSessionOnwer;

  const ChatMessage(
      {super.key,
      required this.message,
      required this.tail,
      required this.isSessionOnwer});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: isSessionOnwer
          ? ThemeColors.mainText
          : ThemeColors.mainThemeBackground,
      tail: tail,
      textStyle: TextStyle(
          color: isSessionOnwer
              ? ThemeColors.cardBackground
              : ThemeColors.mainText,
          fontSize: 16),
      isSender: isSessionOnwer,
    );
  }
}
