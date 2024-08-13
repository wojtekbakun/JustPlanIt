import 'package:calend/data/models/event.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl;
  ApiService({required this.baseUrl});

  Map<String, String> generatePlanBody = {
    'userInput':
        'I want to learn to flutter programming in 3 days. I have no other plans.'
  };

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: {
      'Authorization':
          'Bearer ya29.a0AcM612xUWpphjFqAHgNJvKshk1Dt650q-ez2KYhhn3AkxuvtgzAXZg_oTiD3OjvG-1ghFzzpmkZ-Po-43rpuoZx0aPKYwyutPKJc9YrPEjVOsMfMEwDKk_DY64_-s-hfRLSn8I6ti0BrQfcux8NtWnV04Xbd2mnR2iWQaCgYKAfISARISFQHGX2Mi5Oxs1bAXkhumCvOBJxjz1g0171',
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, String> body) async {
    final response =
        await http.post(Uri.parse('$baseUrl/$endpoint'), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

//send http request
//receive http response
//parse json
//return EventModel
