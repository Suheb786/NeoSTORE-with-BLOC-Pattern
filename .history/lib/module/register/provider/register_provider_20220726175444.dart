import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/register_model.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  Future<dynamic> registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData({n});

    try {
      final response = await _dio.post(
          "http://staging.php-dev.in:8844/trainingapp/api/users/register",
          data: userFormData);
      log(response.data.toString());
      return response;
    } catch (e) {
      log("Api sending failed : ${e.toString()}");
      return {
        "msg": "Error",
        "status": 404,
      };
    }
  }
}
