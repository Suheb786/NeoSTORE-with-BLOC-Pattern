import 'package:dio/dio.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
   registerUser(RegisterModel newUser) async {
    FormData userData = FormData(newUser.toMap());

    try {
      final response = await dio
    } catch (e) {
      
    }
  }
}
