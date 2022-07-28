import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/constants/constant_strings.dart';
import 'data/constants/theme.dart';
import 'data/utils/authentication.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await Hive.initFlutter();
  await Hive.openBox(StringsConstant.box);

  await Authentication().hivePreference();
  Authentication().intialScreen;
  // log(HivePreference().hiveBox.toString());
  final String? currentToken = Authentication().getToken;
  runApp(MyApp(
    currentToken: currentToken,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.currentToken, this.token}) : super(key: key);
  static Routes routes = Routes();
  final String? currentToken;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes(),
      title: 'NeoSTORE with BLOC',
      onGenerateRoute: routes.onGenerate,
    );
  }
}
