import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Widgets/ChatTextField.dart';
import 'package:gemini_app/Presentation/Widgets/MassegeCard.dart';

class Chatview extends StatelessWidget {
  const Chatview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        centerTitle: true,
        title: Text(
          'Chat AI',
          style: TextStyle(
              color: AppColors.lightColor,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: AppColors.lightColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.more_horiz,
              color: AppColors.lightColor,
              size: 28,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Divider(
            color: AppColors.lightColor,
            thickness: 0.1,
          ),
          SizedBox(
            height: 625,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MassegeCard();
              },
            ),
          ),
          Divider(
            color: AppColors.lightColor,
            thickness: 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: ChatTextField(),
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.secondcolor),
                    child: Icon(
                      Icons.send_rounded,
                      size: 24,
                      color: AppColors.lightColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
