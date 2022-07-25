import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ThemeData Themes() {
  return ThemeData(
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: TextStyle(
              fontSize: 35, color: Colors.white, fontFamily: "GothamBold"),
        ),
  );
}
