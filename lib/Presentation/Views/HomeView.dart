
import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Widgets/CahtCard.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor.withOpacity(0.5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Chat Ai',
          style: TextStyle(
              color: AppColors.lightColor,
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Column(
        children: [
          Row(
            children: [],
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChatCard();
            },
          ),
        ],
      ),
    );
  }
}
