import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../routes/app_routes.dart';

import '../../routes/app_pages.dart';
import '../constants/strings.dart';

class HivePreference {
  late Box hiveBox;
  String? accessToken;

  factory HivePreference() => HivePreference._once();

  HivePreference._once();

  Future<void> hivePreference() async {
    hiveBox = Hive.box(Strings.box);
    accessToken = hiveBox.add(Strings.accessToken).toString();
  }

  intialScreen(Object? token, BuildContext context) async {
    log(token.toString());
    if (token == null) {
      Navigator.pushNamed((context), Routes.LOGIN);
      log("user logged out");
    } else {
      Navigator.pushNamed(context, Routes.REGISTER);
    }
  }

  Future<void> setToken(String? token) async {
    if (token == null) {
      hiveBox.clear;
      accessToken = null;
    } else {
      hiveBox.put(Strings.accessToken, token);
      accessToken = hiveBox.get(Strings.accessToken);
    }
    log("this")
  }

  String? get getToken => accessToken;
}
