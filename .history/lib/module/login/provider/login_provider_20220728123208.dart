import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/module/login/model/login_field_model.dart';

import '../../../data/constants/base_url.dart';

class LoginProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.login);

  Future<dynamic> userLogin(LoginFieldModel userInputData) async {
    FormData loginFormData = FormData.fromMap(userInputData.toMap());

    try {
      final response = await client.post(url, body: loginFormData);
    } catch (e) {}
  }
}
