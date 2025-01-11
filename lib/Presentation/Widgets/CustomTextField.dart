import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';

class Custom_TextField extends StatelessWidget {
  final String hint;
  TextEditingController? myController;
  String? Function(String?)? myValidator;

  bool hidetext;
  Custom_TextField({
    required this.myController,
    required this.myValidator,
    required this.hidetext,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: myValidator,
      obscureText: hidetext,
      style: TextStyle(color: AppColors.lightColor),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.lightColor.withOpacity(0.7)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
