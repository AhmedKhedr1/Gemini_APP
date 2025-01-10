import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Views/LoginView.dart';

class Splacshview extends StatelessWidget {
  const Splacshview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 170,
            ),
            Image.asset(
              'assets/images/bot icon2.gif',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'Welcome to Ai',
              style: TextStyle(
                  color: AppColors.lightColor,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' chat bot',
              style: TextStyle(
                  color: AppColors.lightColor,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Your personalized assistant Let’s make your journey easier and more enjoyable!',
              style: TextStyle(
                  color: AppColors.lightColor.withOpacity(0.7), fontSize: 18),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Loginview();
                  },
                ));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(32)),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: AppColors.secondcolor,
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
