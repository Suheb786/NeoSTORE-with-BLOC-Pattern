import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/module/login/provider/login_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void checkLoginButton(
      {required GlobalKey<FormState> formKey,
      required String email,
      required String password}) {
    if (formKey.currentState!.validate()) {

checkResponse = LoginProvider().userLogin(userInputData)


      
      log("Validate");
    }
  }
}
