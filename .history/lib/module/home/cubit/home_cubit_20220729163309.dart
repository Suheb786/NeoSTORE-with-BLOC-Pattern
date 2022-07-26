import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/utils/authentication.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
     FetchUserProvider().fetchUser();

  logout(BuildContext context) {
    Authentication().setToken(null, context);
    emit(HomeLogout());
    log("user Logged out");
  }
}
