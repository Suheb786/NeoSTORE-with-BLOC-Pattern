import 'package:http/http.dart' as http;

class FetchUserProvider {
  final client = http.Client();
  var url = Uri.parse("http://staging.php-dev.in:8844/trainingapp/api/users/getUserData")

  fetchUser() {}
}
