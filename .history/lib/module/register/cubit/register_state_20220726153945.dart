part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterError extends RegisterState {}
class RegisterS extends RegisterState {}