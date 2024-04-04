
import 'package:http/http.dart' as http;
import 'package:task/models/datalistmodels.dart';

class DataListApiCall {
  Future<List<Data>> fetchdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');

    final response = await http.get(
      url,
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return dataFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
