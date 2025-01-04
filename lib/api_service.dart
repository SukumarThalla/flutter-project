// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:rest_api_example/constants.dart';
// import 'package:rest_api_example/user_model.dart';

// class ApiService {
//   Future<List<Welcome>?> getUsers() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Welcome> _model = welcomeFromJson(response.body);
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Welcome>?> getUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a successful response
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
