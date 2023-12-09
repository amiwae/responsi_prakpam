import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static String url = 'https://www.themealdb.com/api/json/v1/1/';
  static Future <Map<String, dynamic>> get(String endpoint) async {
    final response = await http.post(Uri.parse('$url/$endpoint'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body); return jsonBody;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
