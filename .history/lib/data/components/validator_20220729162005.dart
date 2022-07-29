import 'package:flutter/material.dart';

import 'enum.dart';

class Validators {
  String? validPassword(String? value) {
    if (value.toString().isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  String? validpassword(String? value) {
    if (value!.length < 6) {
      return "Password must contain Special, Captial, Small and Numeric Characters";
    }
    return null;
  }

  String? validFirstName(String? fname) {
    if (fname!.length < 3) {
      return "First Name atleast have 3 characters";
    }
    return null;
  }

  String? validConfirmPassword(String? cpass,
      TextEditingController confirmPassword, TextEditingController password) {
    if (confirmPassword.text != password.text) {
      return "Password does not match";
    }
    return null;
  }

  String? validLastName(String? lname) {
    if (lname!.length < 3) {
      return "Last Name atleast have 3 characters";
    }
    return null;
  }

  String? validPhoneNo(String? phone) {
    if (phone!.length < 10) {
      return "Enter a valid phone. no";
    }
    return null;
  }

  String? validEmail(email) {
    if (email!.isEmpty || email == null) {
      return "Email Field cann't be Empty";
    } else if (!emailRex.hasMatch(email)) {
      return "Enter a valid Email";
    }
    return null;
  }

  String genderCheck(var genderType) {
    if (genderType == Gender.male) {
      return "Male";
    } else {
      return "Female";
    }
  }

  String? checkToggleButton(bool? check) {
    if (check == false) {
      return "You have not agreed our Terms and Condtions";
    }
    return null;
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
