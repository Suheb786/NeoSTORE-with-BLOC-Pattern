part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RegisterErrorState extends RegisterState {
  final String? errormsg;

  RegisterErrorState(this.errormsg);
}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
