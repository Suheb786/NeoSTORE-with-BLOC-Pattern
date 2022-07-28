import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../model/login_field_model.dart';

import '../../../data/constants/base_url.dart';

class LoginProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.login);

  Future<dynamic> userLogin(LoginFieldModel userInputData) async {
    var loginFormData = userInputData.toMap();
log(loginFormData)
    try {
      final response = await client.post(url, body: loginFormData);
      var jsonResponse = json.decode(response.body);
      log(response.body.toString());
      if (jsonResponse["status"] == 200) {
        
        return {
          "msg": jsonResponse["message"],
          "status": jsonResponse["status"],
          "token": jsonResponse["data"]["access_token"]
        };
      } else {
        return {
          "msg": jsonResponse["message"],
          "status": jsonResponse["status"],
        };
      }
    } catch (e) {
      log("error detected while authentication : ${e.toString()}");
      return "failed";
    }
  }
}
