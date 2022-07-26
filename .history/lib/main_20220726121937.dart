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
  var box = Hive.openBox(Strings.box);
  await HivePreference.init();
  await HivePreference().hivePreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static Routes routes = Routes();

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
