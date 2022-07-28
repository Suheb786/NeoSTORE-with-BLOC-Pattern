import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ThemeData Themes() {
  return ThemeData(
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: const TextStyle(
              fontSize: 35, color: Colors.white, fontFamily: "GothamBold"),
          headline2: const TextStyle(
              fontSize: 28, color: Colors.white, fontFamily: "GothamBold"),
          headline3: const TextStyle(
              fontSize: 13, color: Colors.white, fontFamily: "GothamMedium"),
          headline4: const TextStyle(
              fontFamily: "Gotham", color: Colors.white, fontSize: 14),
          headline5: const TextStyle(
              fontFamily: "Gotham", color: Colors.white, fontSize: 12),
        ),
  );
}
