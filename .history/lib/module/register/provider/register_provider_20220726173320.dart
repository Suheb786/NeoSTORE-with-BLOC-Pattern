import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
Future<MaxLengthEnforcementp<>>  registerUser(RegisterModel newUser) async {
    FormData userData = FormData(newUser.toMap());
  }
}
