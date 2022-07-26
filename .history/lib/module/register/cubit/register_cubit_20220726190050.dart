import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/data/constants/components/enum.dart';
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
      TextController controller =TextController();
      RegisterModel newUser = RegisterModel(
        firstName: controller.firstNameController.text,
        lastName: controller.lastNameController.text,
        email: controller.emainController.text,
        password: controller.passwordController.text,
        confirmPassword: controller.confirmPasswordController.text,
        gender: Gender.male,
        phoneNumber: phoneNumber,
      );
      final msg = await RegisterProvider().registerUser();
      emit(RegisterSuccessState());
    }
  }
}
