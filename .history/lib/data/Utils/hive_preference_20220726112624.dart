import 'dart:developer';

import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  var useHive;

  Future<void> hivePreference() async {
    useHive = await hiveBox.add("accessToken");
  }

  intialScreen() async {
    log(token.toString());

  }

setToken()async{
if (token) {
  
} else {
  
}
}






}
