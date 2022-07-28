// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/data/utils/authentication.dart';
import 'package:neostorewithbloc/routes/app_routes.dart';

import '../model/login_field_model.dart';
import '../provider/login_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

//* to Login Button Fucntion------------>>>>>>>>>>>.

  void checkLoginButton({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required LoginFieldModel model,
  }) async {
    if (formKey.currentState!.validate()) {
      LoginFieldModel userInputData = LoginFieldModel(
        email: model.email,
        password: model.password,
      );
      final checkResponse = await LoginProvider().userLogin(userInputData);

      //* response [] checking conditions------------->>>>>>>>>

      if (checkResponse["status"] == 200) {
        await Authentication().setToken(checkResponse["token"], context);
        Navigator.popAndPushNamed(context, Routes.HOME);
        log("authenticated");
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    }
  }
}
