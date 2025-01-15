import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final supabase = Supabase.instance.client;
  AuthCubit() : super(AuthInitial());
// create account with email and password
  Future<void> signUpNewUser(String MyEmail, String MyPassword) async {
    emit(RegisterLoading());
    try {
      final response =
          await supabase.auth.signUp(email: MyEmail, password: MyPassword);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      emit(RegisterFailure(
          errormassege: 'there was an error Please try again , error is $e'));
    }
  }

  // log in with email and password
  Future<void> signInWithEmail(String MyEmail, String MyPassword) async {
    emit(LoginLoading());
    try {
      final resoponse = await supabase.auth
          .signInWithPassword(email: MyEmail, password: MyPassword);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure(
          errormassege: 'there was an error Please try again ,error is $e'));
    }
  }
}
