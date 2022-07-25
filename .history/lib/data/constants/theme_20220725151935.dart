import 'package:flutter/material.dart';

ThemeData Themes() {
  return ThemeData(
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: headline1:
        TextStyle(fontSize: 35, color: Colors.white, fontFamily: "GothamBold"),
        ),
  );
}
