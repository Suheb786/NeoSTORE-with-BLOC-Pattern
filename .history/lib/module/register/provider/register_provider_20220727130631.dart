import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;

// import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.register);
  Future<Map<String, dynamic>> registerUser(RegisterModel newUser) async {
    FormData userFormData = FormData(;)
    FormData userFormData = FormData(newUser.toMap());
    try {
      log(userFormData.toString());

      log("before response");
      var response = await client.post(url, userFormData);
      log(" This  is response ${response.data.toString()}");
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
