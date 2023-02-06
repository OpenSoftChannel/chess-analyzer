import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:chess/domain/Assets/styles.dart';
import 'package:chess/ui/views/components/chat_box/chat_box_viewmodel.dart';
import 'package:chess/ui/views/components/chat_box/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ChatBox extends StatelessWidget {
  final int flex;

  const ChatBox({super.key, required this.flex});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: (() => ChatBoxViewModel()),
        builder: (context, viewModel, child) => Expanded(
            flex: flex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: ListView(
                    children: viewModel.chatSession
                        .map(
                          (e) => ChatMessage(
                            message: "--",
                            tail: false,
                            isSessionOnwer: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Divider(
                  height: 5,
                  color: ThemeColors.innerText,
                ),
                Focus(
                  onFocusChange: (value) => viewModel.focusChanged(value),
                  child: TextField(
                    minLines: 6,
                    maxLines: 12,
                    onChanged: (value) => viewModel.chatBoxChanged(value),
                    onSubmitted: (value) => viewModel.chatBoxSubmitted(value),
                    textInputAction: TextInputAction.send,
                    cursorColor: ThemeColors.mainText,
                    controller: viewModel.inputController,
                    style: TextStyle(color: viewModel.textInputFontColor),
                    decoration: InputDecoration(
                      fillColor: viewModel.textFieldSelected,
                      filled: true,
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeColors.mainText, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: ThemeColors.innerText, width: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
