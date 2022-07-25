import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostorewithbloc/module/login/cubit/login_cubit.dart';
import 'package:neostorewithbloc/routes/app_pages.dart';

import '../module/login/view/login_view.dart';

class Routes {
  MaterialPageRoute? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Pages.LOGIN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  create: (context) => LoginCubit(),
                  child: LoginView(),
                ));
      default:
        return null;
    }
  }
}
