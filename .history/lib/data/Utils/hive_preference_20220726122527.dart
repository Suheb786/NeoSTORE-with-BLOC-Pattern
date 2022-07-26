import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:neostorewithbloc/routes/app_routes.dart';

import '../../routes/app_pages.dart';
import '../constants/strings.dart';

class HivePreference {
  late Box hiveBox;
  var accessToken;

  Future<void> init() async {
     hiveBox =   Hive.box(Strings.box);
  }

  Future<void> hivePreference() async {
    accessToken = await hiveBox.add(Strings.accessToken);
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
      hiveBox.delete(Strings.accessToken);
      accessToken = null;
    } else {
      hiveBox.put(Strings.accessToken, token);
      accessToken = hiveBox.get(Strings.accessToken);
    }
  }

  Strings? get getToken => accessToken;
}
