import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



  void checkLoginButton(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      log("Validate");
      Navi
    }
  }
}
