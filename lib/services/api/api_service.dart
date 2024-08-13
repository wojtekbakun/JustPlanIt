import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(Uri.parse(endpoint), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post({
    required String endpoint,
    required Map<String, String> body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
        Uri.parse(
          endpoint,
        ),
        body: body,
        headers: headers ?? {});
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
