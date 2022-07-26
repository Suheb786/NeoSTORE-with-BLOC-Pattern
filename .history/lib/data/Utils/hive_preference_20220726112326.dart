import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  var token;

  Future<void> hivePreference() async {
    token = await hiveBox.add("accessToken");
  }




  
}
