import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/Constants.dart';

class cahtViewBody extends StatefulWidget {
  const cahtViewBody({super.key});

  @override
  State<cahtViewBody> createState() => _cahtViewBodyState();
}

class _cahtViewBodyState extends State<cahtViewBody> {
  List<ChatMessage> messages = [];

  ChatUser CurrentUser = ChatUser(id: '0', firstName: 'User');
  ChatUser GeminiUser =
      ChatUser(id: '1', firstName: 'Gemini', profileImage: BotImage);
  @override
  Widget build(BuildContext context) {
    return DashChat(
      currentUser: CurrentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage ChatMessage) {
    setState(() {
      messages=[ChatMessage,...messages];
    });
  }
}
