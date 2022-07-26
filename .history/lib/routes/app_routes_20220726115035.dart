import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/module/login/cubit/login_cubit.dart';
import 'package:neostorewithbloc/routes/app_pages.dart';

import '../module/login/view/login_view.dart';

class Routes {
  static const LOGIN = "/";
  final LoginCubit _loginCubit = LoginCubit();
  MaterialPageRoute? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => _loginCubit,
            child: LoginView(),
          ),
        );
        case REGISTER:

return MaterialPageRoute(builder: (_)=> RegisterView());  
        
      default:
        return null;
    }
  }

  void dispose() {
    _loginCubit.close();
  }
}
