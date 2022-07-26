import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../routes/app_routes.dart';
import '../constants/strings.dart';

class HivePreference {
  late Box hiveBox;
  String? accessToken;

  factory HivePreference() => HivePreference._once();

  HivePreference._once();

  Future<void> hivePreference() async {
    hiveBox = Hive.box(ConstantStrings.box);
    accessToken = hiveBox.add(ConstantStrings.accessToken).toString();
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
      hiveBox.put(ConstantStrings.accessToken, token);
      accessToken = hiveBox.get(ConstantStrings.accessToken);
    }
    log("this is accessToken : ${accessToken} ");
  }

  String? get getToken => accessToken;
}
