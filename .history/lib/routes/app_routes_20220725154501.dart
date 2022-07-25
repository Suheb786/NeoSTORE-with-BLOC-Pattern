import 'package:flutter/material.dart';
import 'package:neostorewithbloc/routes/app_pages.dart';

import '../module/login/view/login_view.dart';

class Routes {
  MaterialPageRoute? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Pages.LOGIN:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                  create: (context) => L(),
                  child: LoginView(),
                ));
      default:
        return null;
    }
  }
}
