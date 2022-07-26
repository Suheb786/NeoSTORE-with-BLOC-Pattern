import 'dart:developer';

import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  var accessToken;

  Future<void> hivePreference() async {
    accessToken = await hiveBox.add("accessToken");
  }

  intialScreen(Object? token) async {
    log(token.toString());
  }

  setToken(String? token) async {
    if (token == null) {
      useHive.c
    } else {}
  }
}
