import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/strings.dart';

class HivePreference {
  late Box hiveBox;
  var accessToken;

  Future<void> hivePreference() async {
    accessToken = await hiveBox.add(Strings.accessToken);
  }

  intialScreen(Object? token BuildContext context) async {
    log(token.toString());
    if (token == null) {
      Navigator.pushNamed((context), routeName)
    } else {
      
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
