part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {

  
}


class RegisterInitial extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String? errormsg;

  RegisterErrorState(this.errormsg);
}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
