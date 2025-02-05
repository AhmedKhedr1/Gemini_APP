import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/BusinessLogic/cubit/auth_cubit.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Views/HomeView.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Homeview();
            },
          ));
        } else if (state is LoginFailure) {
          print(state.errormassege);
        }
      },
      builder: (context, state) {
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
                          BlocProvider.of<AuthCubit>(context)
                              .signInWithEmail(MyEmail.text, MyPassword.text);
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
                          style: TextStyle(
                              color: AppColors.lightColor, fontSize: 16),
                        ),
                        InkWell(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
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
      },
    );
  }
}
