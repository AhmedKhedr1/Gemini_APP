
import 'package:flutter/material.dart';

class CustomRegisterButton extends StatelessWidget {
  CustomRegisterButton(
      {super.key, required this.Buttontext, required this.Buttonimage});
  final String Buttontext;
  final String Buttonimage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Image.asset(
                Buttonimage,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                Buttontext,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
