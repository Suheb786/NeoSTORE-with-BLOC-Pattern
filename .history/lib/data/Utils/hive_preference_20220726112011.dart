import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  String? token;

  Future<void> hivePreference() async {
    token = hiveBox.add("accessToken");
  }
}
