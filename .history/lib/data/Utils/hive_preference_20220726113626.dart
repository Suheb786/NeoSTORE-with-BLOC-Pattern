import 'dart:developer';

import 'package:hive/hive.dart';

import '../constants/strings.dart';

class HivePreference {
  late Box hiveBox;
  var accessToken;

  Future<void> hivePreference() async {
    accessToken = await hiveBox.add(Strings.accessToken);
  }

  intialScreen(Object? token) async {
    log(token.toString());
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

Strings? get getToken()

}
