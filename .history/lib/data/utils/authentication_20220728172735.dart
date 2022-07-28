import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../routes/app_routes.dart';
import '../constants/constant_strings.dart';

class Authentication {
  // late Box hiveBox;
  String? accessToken;
  factory Authentication() => Authentication._once();
  Authentication._once();

  Future<void> hivePreference() async {
    Box hiveBox = Hive.box(StringsConstant.box);
    accessToken = hiveBox.add(StringsConstant.accessToken).toString();
  }

  intialScreen(String? token, BuildContext context) async {
    log(" ${token.toString()}");
    if (token == null) {
      Navigator.pushNamed((context), Routes.LOGIN);
      log("user logged out");
    } else {
      Navigator.pushNamed(context, Routes.HOME);
    }
  }

  Future<void> setToken(String? token) async {
    Box hiveBox = Hive.box(StringsConstant.box);
    if (token == null) {
      hiveBox.clear();
      Navigator.pus(context, Routes.LOGIN, (route) => false);
      accessToken = null;
    } else {
      hiveBox.put(StringsConstant.accessToken, token);
      accessToken = hiveBox.get(StringsConstant.accessToken);
    }
    log("this is accessToken : $accessToken ");
  }

  String? get getToken =>
      Hive.box(StringsConstant.box).get(StringsConstant.accessToken);
}