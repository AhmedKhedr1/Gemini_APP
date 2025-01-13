import 'package:flutter/material.dart';
import 'package:gemini_app/Presentation/Views/ChatView.dart';
import 'package:gemini_app/Presentation/Views/SplacshView.dart';

void main() {
  runApp(const GeminiAPP());
}

class GeminiAPP extends StatelessWidget {
  const GeminiAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splacshview(),
    );
  }
}
