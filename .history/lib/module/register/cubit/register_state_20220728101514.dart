part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}


enum

class RegisterInitial extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}