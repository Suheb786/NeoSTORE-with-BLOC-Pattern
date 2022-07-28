// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginFieldModel {
  final String email;
  final String password;
  LoginFieldModel({
    required this.email,
    required this.password,
  });

  LoginFieldModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginFieldModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

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

  factory LoginFieldModel.fromJson(String source) => LoginFieldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginFieldModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginFieldModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
