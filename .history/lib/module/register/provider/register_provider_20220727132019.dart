import 'dart:convert';
import 'dart:developer';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// import 'package:dio/dio.dart';
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.register);
  Future<Map<String, dynamic>> registerUser(RegisterModel newUser) async {
    try {
  Map<String,dynamic> userFormData =    {
      'first_name':  newUser.first_name,
      'last_name':  newUser.last_name,
      'email':  newUser.mail,
      'password':  newUser.assword,
      'confirm_password':  newUser.onfirm_password,
      'gender':   newUser.nder,
      'phone_no':  newUser.hone_no,
    };
    

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
