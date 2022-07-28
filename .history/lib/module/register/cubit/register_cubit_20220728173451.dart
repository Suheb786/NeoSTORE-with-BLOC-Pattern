import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/components/enum.dart';
import '../../../routes/app_routes.dart';
import '../model/register_model.dart';
import '../provider/register_provider.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> checkRegisterButton(GlobalKey<FormState> formKey,
      BuildContext context, RegisterModel registerModel) async {
    // emit(RegisterLoadingState());
    if (formKey.currentState!.validate()) {
      RegisterModel newUser = RegisterModel(
        first_name: registerModel.first_name,
        last_name: registerModel.last_name,
        email: registerModel.email,
        password: registerModel.password,
        confirm_password: registerModel.confirm_password,
        gender: "M",
        phone_no: registerModel.phone_no,
      );
      // log(newUser.toString());
      final msg = await RegisterProvider().registerUser(newUser);
      log(msg.toString());
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.LOGIN, (route) => false);
      if (msg["status"] == 200) {
        log("Success");
        emit(RegisterSuccessState());
      } else {
        log("unsuccess");
        emit(RegisterErrorState('Unsuccessull'));
      }
      // emit(RegisterSuccessState());
    }
  }

  void radioOnChanged(Gender genderType, Object? val) {
    genderType = val as Gender;
  }
}
