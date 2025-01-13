import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Views/ChatView.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat Ai',
          style: TextStyle(
              color: AppColors.lightColor,
              fontSize: 28,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Chatview();
                  },
                ));
              },
              child: Text('NewChat'))
        ],
      ),
    );
  }
}
