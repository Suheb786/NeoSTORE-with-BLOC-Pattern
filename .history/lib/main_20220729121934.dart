import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/constants/constant_strings.dart';
import 'data/constants/theme.dart';
import 'data/utils/authentication.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  String? token;
  // BuildContext context;
  await Hive.initFlutter();
  await Hive.openBox(StringsConstant.box);

  await Authentication().hivePreference();
  Authentication().intialScreen(token, context);
  // log(HivePreference().hiveBox.toString());
  final String? currentToken = Authentication().getToken;

  runApp(MyApp(
    currentToken: currentToken,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.currentToken}) : super(key: key);
  static Routes routes = Routes();
  final String? currentToken;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes(),
        title: 'NeoSTORE with BLOC',
        onGenerateRoute: routes.onGenerate,
        initialRoute: currentToken == null ? Routes.LOGIN : Routes.HOME);
  }
}
