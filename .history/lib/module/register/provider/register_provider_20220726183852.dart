import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/components/text_editing_controllers.dart';
import 'package:neostorewithbloc/data/constants/constant_parameters.dart';

import '../model/register_model.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData({
      "fd": ""
    });

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
