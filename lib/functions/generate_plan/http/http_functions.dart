import 'package:calend/functions/generate_plan/http/event_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

fetchJsonResponse(String url, String userInput) async {
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "userInput": userInput,
      }),
    );

    if (response.statusCode == 200) {
      // Jeśli serwer zwróci odpowiedź 200 OK, zwróć ciało odpowiedzi.
      return decodeEvents(response.body);
    } else {
      // Jeśli serwer nie zwróci odpowiedzi 200 OK,
      // rzuć wyjątek.
      debugPrint("code ${response.statusCode}");
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error reading JSON file: $e');
    return [];
  }
}
