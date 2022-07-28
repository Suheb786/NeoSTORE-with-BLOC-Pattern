part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}




class RegisterInitial extends RegisterState {}

class RegisterErrorState extends RegisterState {
  string error
}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
