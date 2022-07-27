import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

import '../../../data/constants/constant_parameters.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData.fromMap({
       ConstantParameter.first_name: RegisterModel.firstName,
      ConstantParameter.last_name: lastName,
      ConstantParameter.email: email,
      ConstantParameter.password: password,
      ConstantParameter.confirm_password: confirmPassword,
      ConstantParameter.gender: gender,
      ConstantParameter.phone_no: phoneNumber
    });
    try {
      var response = await _dio.post(
          "http://staging.php-dev.in:8844/trainingapp/api/users/register",
          data: userFormData);
      log(response.data.toString());
      return {
        "msg": json.decode(response.data)["message"],
        "status": json.decode(response.data)["status"],
      };
    } catch (e) {
      log("Api sending failed : ${e.toString()}");
      return {
        "msg": "Error",
        "status": 404,
      };
    }
  }
}
