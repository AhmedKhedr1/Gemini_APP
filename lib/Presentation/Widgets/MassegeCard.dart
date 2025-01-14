import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';

class MassegeCard extends StatelessWidget {
  const MassegeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
             // topRight: Radius.circular(12),
             topLeft: Radius.circular(14)
            ),
          ),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            'Hello Welcome to app',
            style: TextStyle(color: AppColors.lightColor, fontSize: 17),
          ),
        )
      ],
    );
  }
}
