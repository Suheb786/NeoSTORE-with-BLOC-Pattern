import 'dart:developer';

import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  var useHive;
  


  Future<void> hivePreference() async {
    useHive = await hiveBox.add("accessToken");
  }

  intialScreen(Object? token) async {
    log(token.toString());

  }

setToken(String token)async{
if (token == null) {
  
} else {
  
}
}






}
