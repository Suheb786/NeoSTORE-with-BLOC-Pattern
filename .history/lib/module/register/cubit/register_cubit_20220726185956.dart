import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/data/constants/components/text_editing_controllers.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';
import 'package:neostorewithbloc/module/register/provider/register_provider.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  checkRegisterButton(GlobalKey<FormState> formKey) async {
    emit(RegisterLoadingState());
    if (formKey.currentState!.validate()) {
      log("nice");
      TextController controller =Text
      RegisterModel newUser = RegisterModel(
        firstName: TextController().firstNameController.text,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        gender: gender,
        phoneNumber: phoneNumber,
      );
      final msg = await RegisterProvider().registerUser();
      emit(RegisterSuccessState());
    }
  }
}
