import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neostorewithbloc/data/utils/authentication.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  logout(B) {
    Authentication().setToken(null, context);
    log("user Logged out");
  }
}
