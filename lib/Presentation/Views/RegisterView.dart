// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/BusinessLogic/cubit/auth_cubit.dart';
import 'package:gemini_app/Constants/AppColors.dart';
import 'package:gemini_app/Presentation/Views/LoginView.dart';
import 'package:gemini_app/Presentation/Widgets/CustomButton.dart';
import 'package:gemini_app/Presentation/Widgets/CustomTextField.dart';

class RegisterView extends StatelessWidget {
  GlobalKey<FormState> globalkey = GlobalKey();
  TextEditingController MyEmail = TextEditingController();
  TextEditingController MyPassword = TextEditingController();
  TextEditingController UserName = TextEditingController();

  RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
    if (state is RegisterSuccess) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Loginview();
          },
        ));
      } else if (state is RegisterFailure) {
        print(state.errormassege);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: globalkey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Image.asset('assets/images/bot icon.gif'),
                Column(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                          color: AppColors.lightColor,
                          fontSize: 34,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Create Your Account',
                      style: TextStyle(
                          color: AppColors.lightColor.withOpacity(.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Custom_TextField(
                  hint: 'User Name',
                  hidetext: false,
                  myController: UserName,
                  myValidator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return 'Please Enter Your Name';
                    } else {}
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Custom_TextField(
                  hint: 'Email',
                  hidetext: false,
                  myController: MyEmail,
                  myValidator: (Value) {
                    if (Value == null || Value.isEmpty) {
                      return 'Please Enter Your Email';
                    } else {}
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Custom_TextField(
                  hint: 'Password',
                  hidetext: true,
                  myController: MyPassword,
                  myValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Password';
                    } else {}
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      if (globalkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .signUpNewUser(MyEmail.text, MyPassword.text);
                      }
                    },
                    child: Custom_button(buttonInfo: 'Sign Up')),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account ?  ',
                        style: TextStyle(
                            color: AppColors.lightColor, fontSize: 16),
                      ),
                      InkWell(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Loginview();
                                },
                              )),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: AppColors.secondcolor, fontSize: 16),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
