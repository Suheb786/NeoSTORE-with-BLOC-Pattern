import 'dart:developer';

import 'package:flutter/material.dart';

class LoginController {
  String? validPassword(String? value) {
    if (value.toString().isEmpty) {
      return "Please enter your password";
    }
  }

  String? validEmail(String? email) {
    if (email.toString().isEmpty) {
      return "Enter your email";
    }
  }

  void checkLoginButton(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      log("Validate")
    }
  }
}
