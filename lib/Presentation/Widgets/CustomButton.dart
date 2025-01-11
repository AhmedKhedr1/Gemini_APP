import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';

class Custom_button extends StatelessWidget {
  String buttonInfo;
  Custom_button({
    required this.buttonInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightColor, borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Text(
          buttonInfo,
          style: TextStyle(
              color: AppColors.secondcolor,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
