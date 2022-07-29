import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../module/home/cubit/home_cubit.dart';
import '../module/home/home_view.dart';
import '../module/register/cubit/register_cubit.dart';
import '../module/login/cubit/login_cubit.dart';
import '../module/register/view/register_view.dart';
import 'app_pages.dart';

import '../module/login/view/login_view.dart';

class Routes {
  //* Path -------------->>>>>
  static const LOGIN = "/";
  static const REGISTER = "/register";
  static const HOME = "/home";

//*Cubit Instences ---------------->>>>>>>
  // final LoginCubit _loginCubit = LoginCubit();
  final RegisterCubit _registerCubit = RegisterCubit();

  MaterialPageRoute? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {

//* for Login Routing ------------>>>>>>
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginView(),
          ),
        );

//* for Regiter Routing ---------->>>>>>>
      case REGISTER:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => _registerCubit,
                  child: RegisterView(),
                ));
//* for Home Routing ---------->>>>>>>
      case HOME:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: HomeView(),
                ));
      default:
        return null;
    }
  }

  // void dispose() {
  //   _loginCubit.close();
  //   _registerCubit.close();
  // }
}
