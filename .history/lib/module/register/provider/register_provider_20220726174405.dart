import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
  registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData(newUser.toMap());

    try {
      final response = await Dio().post(
          "http://staging.php-dev.in:8844/trainingapp/api/users/register",
          data: userFormData);
log(response.body)

    } catch (e) {}
  }
}
