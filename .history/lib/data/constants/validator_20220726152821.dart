class Validators {
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

  String? validConfirmPassword(String? cpass) {
    if (confirmPasswordController.text != passwordController.text ||
        confirmPasswordController.text.isEmpty) {
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

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
