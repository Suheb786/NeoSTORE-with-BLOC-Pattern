// ignore_for_file: use_build_context_synchronously

import 'dart:async';
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
  StreamSubscription? _streamSubscription;
//* to Login Button Fucntion------------>>>>>>>>>>>.

  void checkLoginButton({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required LoginFieldModel model,
  }) async {
    // if (formKey.currentState!.validate()) {
    // emit(LoginLoading());
    log("${model.email}, ${model.password}");
    final checkResponse = await LoginProvider().userLogin(model);

    ///* response checking conditions------------->>>>>>>>>

    if (checkResponse["status"] == 200) {
   _   await Authentication().setToken(checkResponse["token"], context);

      log("authenticated");
      emit(LoginSuccess());
    } else {
      emit(LoginFailed());
    }
  }
}
