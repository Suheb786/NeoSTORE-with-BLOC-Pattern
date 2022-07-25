import 'package:flutter/material.dart';

ThemeData Themes() {
  return ThemeData(
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
  );
}
