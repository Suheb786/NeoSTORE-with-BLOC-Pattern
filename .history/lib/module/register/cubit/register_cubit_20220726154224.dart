import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  checkRegisterButton(GlobalKey<FormState> formKey) {
    emit(RegisterLoadingState())
    if (formKey.currentState!.validate()) {
      log("nice");
      emit(RegisterSuccessState());
    }
  }
}
