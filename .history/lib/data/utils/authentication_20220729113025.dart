import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../routes/app_routes.dart';
import '../constants/constant_strings.dart';

class Authentication {
  Box hiveBox = Hive.box(StringsConstant.box);
  String? accessToken;
  factory Authentication() => Authentication._once();
  Authentication._once();

  Future<void> hivePreference() async {
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

  Future<void> setToken(String? token, BuildContext context) async {
    Box hiveBox = Hive.box(StringsConstant.box);
    if (token == null) {
      hiveBox.clear();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.LOGIN, (route) => false);
      accessToken = null;
    } else {
      hiveBox.put(StringsConstant.accessToken, token);
      accessToken = hiveBox.get(StringsConstant.accessToken);
    }
    log("this is accessToken : $accessToken ");
  }

  String? get getToken : (){} hiveBox.get(StringsConstant.accessToken);
}
