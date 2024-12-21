import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<dynamic>> sendQueryToBackendCasting(int query) async {
  final String backendUrl = 'https://rating-movie-app-back.fly.dev/credits?query=$query'; // version déploy
  // final String backendUrl = 'http://10.0.2.2:3000/credits?query=$query'; //  Si j'ai pas push la dernière version du back

  try {
    final response = await http.get(Uri.parse(backendUrl));
    if (response.statusCode == 200) {
      List results = json.decode(response.body);
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
