import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/module/login/model/login_field_model.dart';

class LoginProvider {
  final client = http.Client();
   

  Future<dynamic> userLogin(LoginFieldModel userInputData) async {
    FormData loginFormData = FormData.fromMap(userInputData.toMap());

try { 
  final response = await client.post(url)
  
} catch (e) {
  
}


  }
}
