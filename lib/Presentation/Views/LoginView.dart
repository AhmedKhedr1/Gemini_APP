import 'package:flutter/material.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Views/CahtView.dart';
import 'package:gemini_app/Presentation/Views/RegisterView.dart';
import 'package:gemini_app/Presentation/Widgets/CustomButton.dart';
import 'package:gemini_app/Presentation/Widgets/CustomTextField.dart';

class Loginview extends StatelessWidget {
  GlobalKey<FormState> globalkey = GlobalKey();
  TextEditingController MyEmail = TextEditingController();
  TextEditingController MyPassword = TextEditingController();

  Loginview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: globalkey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 90,
              ),
              Image.asset(
                'assets/images/bot icon.gif',
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: AppColors.lightColor.withOpacity(0.9),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Custom_TextField(
                hint: 'Enter Your Email',
                hidetext: false,
                myController: MyEmail,
                myValidator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'Please enter your Email';
                  } else {}
                },
              ),
              SizedBox(
                height: 24,
              ),
              Custom_TextField(
                hint: 'Enter Your Password',
                hidetext: true,
                myController: MyPassword,
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else {}
                },
              ),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                  onTap: () {
                    if (globalkey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Cahtview();
                        },
                      ));
                    } else {}
                  },
                  child: Custom_button(buttonInfo: 'Login')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?  ',
                      style: TextStyle(color: AppColors.lightColor, fontSize: 16),
                    ),
                    InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RegisterView();
                              },
                            )),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColors.secondcolor, fontSize: 16),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
