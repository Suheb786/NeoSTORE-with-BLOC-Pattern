// import 'package:neostorewithbloc/data/components/enum.dart';
// import 'package:neostorewithbloc/data/constants/constant_parameters.dart';

// class RegisterModel {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String password;
//   final String confirmPassword;
//   final Gender gender;
//   final String phoneNumber;

//   RegisterModel({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.password,
//     required this.confirmPassword,
//     required this.gender,
//     required this.phoneNumber,
//   });

//   Map<String, dynamic> map() {
//     return {
//       ConstantParameter.first_name: firstName,
//       ConstantParameter.last_name: lastName,
//       ConstantParameter.email: email,
//       ConstantParameter.password: password,
//       ConstantParameter.confirm_password: confirmPassword,
//       ConstantParameter.gender: gender,
//       ConstantParameter.phone_no: phoneNumber
//     };
//   }
// }

// ignore_for_file: non_constant_identifier_names

import 'package:neostorewithbloc/data/constants/constant_parameters.dart';

class RegisterModel {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String confirm_password;
  final String gender;
  final String phone_no;
  RegisterModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.confirm_password,
    required this.gender,
    required this.phone_no,
  });

  Map<String, dynamic> toMap() {
    return {
   ConstantParameter.first_name   : first_name,
     ConstantParameter.last_name:  last_name,
ConstantParameter.email: email,
      : password,
      : confirm_password,
      : gender,
     ConstantParameter.phone_no: phone_no,
    };
  }
}
