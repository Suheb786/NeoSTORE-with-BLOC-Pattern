import 'package:neostorewithbloc/data/constants/constant_parameters.dart';

import '../../../data/constants/components/enum.dart';

class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final Gender gender;
  final String phoneNumber;

  RegisterModel(
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.gender,
    this.phoneNumber,
  );

Map<String,dynamic> toMap(){
  return {
    ConstantParameter.first_name: firstName,
    ConstantParameter.last_name: lastName,
    ConstantParameter.
  }
}


}
