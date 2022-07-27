import 'dart:convert';
import 'dart:developer';

import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/data/components/text_editing_controllers.dart';

// import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

import '../view/register_view.dart';

class RegisterProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.register);
  TextControllers controllers = TextControllers();
  Future<Map<String, dynamic>> registerUser( RegisterModel userData) async {
    // FormData userFormData = FormData.fromMap(map);
    // FormData userFormData = FormData(newUser.toMap());
    Map<String, dynamic> userFormData = {
      'first_name': ,
      'last_name': controllers.lastNameController.text,
      'email': controllers.emailController.text,
      'password': controllers.passwordController.text,
      'confirm_password': controllers.confirmPasswordController.text,
      'gender': "Male",
      'phone_no': controllers.phoneNoController.text
    };

    try {
      // log(userFormData.toString());

      log("before response");
      var response = await client.post(url, body: userFormData);
      log(" This  is response ${response.body.toString()}");
      return {
        "msg": json.decode(response.body)["message"],
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
