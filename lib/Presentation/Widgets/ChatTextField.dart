
import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';

class ChatTextField extends StatelessWidget {
 TextEditingController CahtController=TextEditingController();
 
   ChatTextField({required this.CahtController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:CahtController ,
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
    );
  }
}
