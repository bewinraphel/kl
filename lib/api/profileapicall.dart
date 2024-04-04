import 'package:task/models/profilrmodel.dart';
import 'package:http/http.dart' as http;

class ProfileApiCall {
  Future<Profile> fetchdata() async {
    var url = Uri.parse('https://reqres.in/api/login');

    final response = await http.get(
      url,
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
