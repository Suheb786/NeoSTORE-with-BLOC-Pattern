import 'dart:convert';
import 'dart:developer';

import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/data/components/text_editing_controllers.dart';

// import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

import '../view/register_view.dart';

class RegisterProvider {
  // final client = http.Client();
  Dio _dio = Dio();
  // var url = Uri.parse(BaseURL.register);
  TextControllers controllers = TextControllers();
  Future<Map<String, dynamic>> registerUser(RegisterModel userData) async {
    FormData userFormData = FormData.fromMap(userData.toMap());
    // FormData userFormData = FormData(newUser.toMap());
    // Map<String, dynamic> userFormData = {
    //   'first_name': userData.first_name,
    //   'last_name': userData.last_name,
    //   'email': userData.email,
    //   'password': userData.password,
    //   'confirm_password': userData.confirm_password,
    //   'gender': "Male",
    //   'phone_no': userData.phone_no
    // };

    try {
      // log(userFormData.toString());

      log("before response");
      var response = await _dio.post(BaseURL.register, data: userFormData);
      log(" This  is response ${response.data.toString()}");
      return {
        "msg": json.decode(response.data)["message"],
        "status": json.decode(response.body)["status"],
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
