import 'package:flutter/material.dart';
import 'package:neostorewithbloc/routes/app_pages.dart';

class Routes {
  Route<dynamic> onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Pages.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return null;
    }
  }
}
