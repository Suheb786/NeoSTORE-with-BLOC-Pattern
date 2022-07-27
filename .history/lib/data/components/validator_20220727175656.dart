import 'package:flutter/material.dart';
import 'package:neostorewithbloc/data/components/enum.dart';

import 'text_editing_controllers.dart';

class Validators {
  String? validPassword(String? value) {
    if (value.toString().isEmpty) {
      return "Please enter your password";
    }
  }

  String? validpassword(String? value) {
    if (value!.length < 6) {
      return "Password must contain Special, Captial, Small and Numeric Characters";
    }
  }

  String? validFirstName(String? fname) {
    if (fname!.length < 3) {
      return "First Name atleast have 3 characters";
    }
  }

  String? validConfirmPassword(String? cpass,
      TextEditingController confirm_password, TextEditingController password) {
    if (confirm_password.text != password.text) {
      return "Password does not match";
    }
  }

  String? validLastName(String? lname) {
    if (lname!.length < 3) {
      return "Last Name atleast have 3 characters";
    }
  }

  String? validPhoneNo(String? phone) {
    if (phone!.length < 10) {
      return "Enter a valid phone. no";
    }
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

  String checkToggleButton(bool? check) {
    if (check != true) {
      return "You have not agreed our Terms and Condtions";
    }
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
