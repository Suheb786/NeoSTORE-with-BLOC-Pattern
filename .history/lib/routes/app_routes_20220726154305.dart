import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../module/login/cubit/login_cubit.dart';
import '../module/register/register_view.dart';
import 'app_pages.dart';

import '../module/login/view/login_view.dart';

class Routes {
  //* Path -------------->>>>>
  static const LOGIN = "/";
  static const REGISTER = "/register";

//*Cubit Instences ---------------->>>>>>>
  final LoginCubit _loginCubit = LoginCubit();

  MaterialPageRoute? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {

//* for Login Routing ------------>>>>>>
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => _loginCubit,
            child: LoginView(),
          ),
        );

//* for Regiter Routing ---------->>>>>>>
      case REGISTER:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: RegisterView(),
                ));

      default:
        return null;
    }
  }

  void dispose() {
    _loginCubit.close();
  }
}
