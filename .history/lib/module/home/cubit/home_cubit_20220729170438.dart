import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neostorewithbloc/data/models/fetch_user_model.dart';
import 'package:neostorewithbloc/data/network/common_provider/fetch_user_provider.dart';
import '../../../data/utils/authentication.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  FetchUserProvider fetchUserProvider = FetchUserProvider();

  getHomeScreen() async {
    try {
      final fetchingUser = await fetchUserProvider.fetchUser();
      if (fetchingUser is UserData) {
        emit(HomeLoaded());
      }
    } catch (e) {
      emit(HomeError(errormsg: e.toString()));
    }
  }

  logout(BuildContext context) {
    Authentication().setToken(null, context);
    emit(HomeLogout());
    log("user Logged out");
  }
}
