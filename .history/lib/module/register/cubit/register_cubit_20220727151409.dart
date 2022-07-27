import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neostorewithbloc/data/components/enum.dart';

import 'package:neostorewithbloc/module/register/model/register_model.dart';
import 'package:neostorewithbloc/module/register/provider/register_provider.dart';
import 'package:neostorewithbloc/module/register/view/register_view.dart';
import 'package:neostorewithbloc/routes/app_routes.dart';

import '../../../data/components/text_editing_controllers.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> checkRegisterButton(
      GlobalKey<FormState> formKey, BuildContext context ,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
TextEditingController emailController,
TextEditingController passwordController,
TextEditingController confir
      ) async {
    if (formKey.currentState!.validate()) {
      log("nice");
      TextControllers controller = TextControllers();
      RegisterModel newUser = RegisterModel(
        first_name: 
        last_name: controller.lastNameController.text,
        email: controller.emailController.text,
        password: controller.passwordController.text,
        confirm_password: controller.confirmPasswordController.text,
        gender: "M",
        phone_no: controller.phoneNoController.text,
      );
      // log(newUser.toString());
      final msg = await RegisterProvider().registerUser(newUser);
      log(msg.toString());
      // ignore: use_build_context_synchronously
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Routes.LOGIN, (route) => false);
      if (msg["status"] == 200) {
        log("Success");
      } else {
        log("unsuccess");
      }
      // emit(RegisterSuccessState());
    }
  }
}
