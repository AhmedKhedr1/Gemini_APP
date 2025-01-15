import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUpNewUser(String MyEmail, String MyPassword) async {
    final supabase = Supabase.instance.client;
    emit(RegisterLoading());
    try {
      final response =
          await supabase.auth.signUp(email: MyEmail, password: MyPassword);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      emit(
          RegisterFailure(errormassege: 'there was an error Please try again'));
    }
  }
}
