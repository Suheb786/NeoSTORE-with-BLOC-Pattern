import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../routes/app_routes.dart';
import '../constants/constant_strings.dart';

class Authentication {
  String? accessToken;
  factory Authentication() => Authentication._once();
  Authentication._once();
  Box hiveBox = Hive.box(StringsConstant.box);
  Future<void> hivePreference() async {
    accessToken = hiveBox.add(StringsConstant.accessToken).toString();
  }

  Future<void> setToken(String? token, BuildContext context) async {
    Box hiveBox = Hive.box(StringsConstant.box);
    if (token == null) {
      hiveBox.clear();
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
