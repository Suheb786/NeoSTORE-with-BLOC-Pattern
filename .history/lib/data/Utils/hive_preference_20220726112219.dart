import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  int token;

  Future<void> hivePreference() async {
    token = await hiveBox.add("accessToken");
  }
}
