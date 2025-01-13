import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';

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
        physics: NeverScrollableScrollPhysics(),
        children: [
          Divider(
            color: AppColors.lightColor,
            thickness: 0.1,
          ),
          SizedBox(
            height: 625,
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
                  child: TextField(
                    style: TextStyle(color: AppColors.lightColor),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.01),
                      hintText: 'Ask ai chat anything',
                      hintStyle: TextStyle(
                          color: AppColors.lightColor.withOpacity(0.4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.1)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
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
