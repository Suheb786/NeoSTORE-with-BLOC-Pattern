import 'package:hive/hive.dart';

class HivePreference {
  late Box hiveBox;
  Rx<Type> obj = Rx<Type>();

  Future<void> hivePreference() async {
    token = hiveBox.add("accessToken");
  }
}
