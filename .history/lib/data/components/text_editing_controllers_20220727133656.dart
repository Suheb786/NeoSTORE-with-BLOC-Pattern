import 'package:flutter/material.dart';

class CustomTextController {
//* used in Login Screen ------- >>>>
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

//*used in registration screen-------->>>>
  static const TextEditingController firstNameController =
      constTextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}
