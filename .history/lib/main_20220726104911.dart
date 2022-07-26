import 'package:flutter/material.dart';
import 'package:neostorewithbloc/routes/app_routes.dart';

import 'data/constants/theme.dart';

void main() {
  
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
