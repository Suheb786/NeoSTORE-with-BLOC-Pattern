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
  String? errormsg;
}
