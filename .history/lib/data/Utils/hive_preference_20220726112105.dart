import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  String? token;

  Future<void> hivePreference() async {
    token = await hiveBox.s("accessToken");
  }
}
