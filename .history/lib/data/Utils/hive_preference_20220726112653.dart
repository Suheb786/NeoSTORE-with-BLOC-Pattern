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

setToken(Object)async{
if (token) {
  
} else {
  
}
}






}
