import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:chess/ui/views/components/chat_box/chat_box_viewmodel.dart';
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  BubbleSpecialThree(
                    text: 'Added iMassage shape bubbles',
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: 'Please try and give some feedback on it!',
                    color: Color(0xFF1B97F3),
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: 'Sure',
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    isSender: false,
                  ),
                  BubbleSpecialThree(
                    text: "I tried. It's awesome!!!",
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    isSender: false,
                  ),
                  BubbleSpecialThree(
                    text: "Thanks",
                    color: Color(0xFFE8E8EE),
                    tail: true,
                    isSender: false,
                  )
                ],
              ),
            ),
            MessageBar(
              onSend: (_) => print(_),
              actions: [
                InkWell(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: InkWell(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
