import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData.fromMap(newUser.toMap());
    try {
      var response = await _dio.post(BaseURL.register, data: userFormData);
      log( " This  is response ${response.data.toString());
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
