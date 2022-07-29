// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLogout extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  String errormsg;
  HomeError({
    required this.errormsg,
  });
}
