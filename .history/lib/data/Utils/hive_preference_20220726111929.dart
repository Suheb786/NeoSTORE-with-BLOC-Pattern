import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  Rx<String> obj = Rx<String>();

  Future<void> hivePreference() async {
    token = hiveBox.add("accessToken");
  }
}
