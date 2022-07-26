import 'dart:convert';
import 'dart:developer';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/data/components/text_editing_controllers.dart';

// import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.register);
  TextControllers controller = TextControllers();

  Future<Map<String, dynamic>> registerUser(
    RegisterModel newUser,
  ) async {
    Map<String, dynamic> userData = {
      'first_name': controller.firstNameController.text,
      'last_name': controller.lastNameController,
      'email': controller.emailController,
      'password': controller.passwordController,
      'confirm_password': controller.confirmPasswordController,
      'gender': "M",
      'phone_no': controller.phoneNoController,
    };

    try {
      var response = await client.post(url, body: user);
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
