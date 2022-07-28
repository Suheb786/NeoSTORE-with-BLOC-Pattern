import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../data/components/text_editing_controllers.dart';
import '../../../data/constants/base_url.dart';
import '../model/register_model.dart';

class RegisterProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.register);
  TextControllers controllers = TextControllers();
  Future<Map<String, dynamic>> registerUser(RegisterModel userData) async {
    Map<String, dynamic> userFormData = {
      'first_name': userData.first_name,
      'last_name': userData.last_name,
      'email': userData.email,
      'password': userData.password,
      'confirm_password': userData.confirm_password,
      'gender': "Male",
      'phone_no': userData.phone_no
    };
    try {
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
