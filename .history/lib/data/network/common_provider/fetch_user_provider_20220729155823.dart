import 'package:http/http.dart' as http;
import 'package:neostorewithbloc/data/constants/base_url.dart';

class FetchUserProvider {
  final client = http.Client();
  var url = Uri.parse(BaseURL.fetchUser);

  fetchUser() {}
}
