import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/data/constants/base_url.dart';
import 'package:neostorewithbloc/data/utils/authentication.dart';

class FetchUserProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.fetchUser);
  final token

  Future<dynamic> fetchUser() async {
    final response = http.get(url, headers: {
      "access_token": Authentication().getToken
    });
  }
}
