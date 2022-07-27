import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/data/components/enum.dart';

import 'package:neostorewithbloc/module/register/model/register_model.dart';
import 'package:neostorewithbloc/module/register/provider/register_provider.dart';
import 'package:neostorewithbloc/routes/app_routes.dart';

import '../../../data/components/text_editing_controllers.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  checkRegisterButton(
      GlobalKey<FormState> formKey, BuildContext context) async {
    emit(RegisterLoadingState());
    if (formKey.currentState!.validate()) {
      log("nice");
      TextController controller = TextController();
      RegisterModel newUser = RegisterModel(
        firstName: controller.firstNameController.text,
        lastName: controller.lastNameController.text,
        email: controller.emainController.text,
        password: controller.passwordController.text,
        confirmPassword: controller.confirmPasswordController.text,
        gender: Gender.male ? "M": "F",
        phoneNumber: controller.phoneNoController,
      );
      final msg = await RegisterProvider().registerUser(newUser);
      log(msg.toString());
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.LOGIN, (route) => false);
      if (msg["status"] == 200) {
        log("Success");
      } else {
        log("unsuccess");
      }
      emit(RegisterSuccessState());
    }
  }
}
