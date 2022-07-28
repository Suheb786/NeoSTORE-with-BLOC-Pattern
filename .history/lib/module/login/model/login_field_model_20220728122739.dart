// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginFieldModel {
  final String email;
  final String password;
  LoginFieldModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginFieldModel.fromMap(Map<String, dynamic> map) {
    return LoginFieldModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFieldModel.fromJson(String source) =>
      LoginFieldModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
