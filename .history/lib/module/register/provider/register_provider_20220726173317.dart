import 'package:dio/dio.dart';
import 'package:neostorewithbloc/module/register/model/register_model.dart';

class RegisterProvider {
Future<Mal>  registerUser(RegisterModel newUser) async {
    FormData userData = FormData(newUser.toMap());
  }
}
