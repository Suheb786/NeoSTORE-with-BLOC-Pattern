import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/module/login/model/login_field_model.dart';
import 'package:neostorewithbloc/module/login/provider/login_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void checkLoginButton(
      {required GlobalKey<FormState> formKey,
      // required String email,
      // required String password,
      required LoginFieldModel model}) {
    if (formKey.currentState!.validate()) {
      LoginFieldModel userInputData =
          LoginFieldModel(email: model.email, password: model.password);
      final checkResponse = await LoginProvider().userLogin(userInputData);

      log("Validate");
      if (checkResponse["status"] == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    }
  }
}
