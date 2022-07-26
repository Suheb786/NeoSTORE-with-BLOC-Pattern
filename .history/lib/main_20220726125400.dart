import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neostorewithbloc/data/Utils/hive_preference.dart';
import 'package:neostorewithbloc/data/constants/strings.dart';

import 'package:neostorewithbloc/routes/app_routes.dart';

import 'data/constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await Hive.initFlutter();
  await Hive.openBox(Strings.box);

  await HivePreference().hivePreference();
  final Strings? currentToken = HivePreference().getToken;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String? currentToken;

  MyApp({required this.currenToken, Key? key}) : super(key: key);
  static Routes routes = Routes();
  Strings currenToken

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes(),
        title: 'NeoSTORE with BLOC',
        onGenerateRoute: routes.onGenerate,
        initialRoute: currentToken != null ? Routes.REGISTER : Routes.LOGIN);
  }
}
