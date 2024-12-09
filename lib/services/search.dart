import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<dynamic>> sendQueryToBackend(String query) async {
  final String backendUrl = 'https://rating-movie-app-back.fly.dev//search?query=$query';
  // final String backendUrl = 'http://10.0.2.2:3000/search?query=$query'; //  Si j'ai pas push la dernière version du back

  try {
    final response = await http.get(Uri.parse(backendUrl));
    if (response.statusCode == 200) {
      List results = json.decode(response.body);
      print('Results from backend: $results');
      return results;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error sending query: $e');
    return [];
  }
}
