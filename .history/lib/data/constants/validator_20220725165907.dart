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
}
