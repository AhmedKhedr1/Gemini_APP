import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Constants/Constants.dart';

class cahtViewBody extends StatefulWidget {
  const cahtViewBody({super.key});

  @override
  State<cahtViewBody> createState() => _cahtViewBodyState();
}

class _cahtViewBodyState extends State<cahtViewBody> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser =
      ChatUser(id: "1", firstName: "Gemini", profileImage: BotImage);
  @override
  Widget build(BuildContext context) {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
      inputOptions: ChatTextFieldOptions(),
      messageOptions: MessageOptions(
        textColor: Colors.white,
        currentUserContainerColor: AppColors.lightColor.withOpacity(0.1),
        containerColor: AppColors.lightColor.withOpacity(0.1),
      ),
    );
  }

  InputOptions ChatTextFieldOptions() {
    return InputOptions(
      inputTextStyle: TextStyle(color: Colors.white),
      inputDecoration: InputDecoration(
        fillColor: AppColors.lightColor.withOpacity(.1),
        filled: true,
        hintText: "Ask ai chat anything ",
        hintStyle: TextStyle(color: AppColors.lightColor.withOpacity(0.7)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.lightColor.withOpacity(0.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.lightColor.withOpacity(0.4),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.lightColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);

          String response = event.content?.parts?.fold("", (previous, current) {
                if (current is TextPart) {
                  return "$previous ${current.text}";
                }
                return previous;
              }) ??
              "";

          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold("", (previous, current) {
                if (current is TextPart) {
                  return "$previous ${current.text}";
                }
                return previous;
              }) ??
              "";

          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );

          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
