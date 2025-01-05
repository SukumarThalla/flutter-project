import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Welcome>?> getUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return body.map((e) => Welcome.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
