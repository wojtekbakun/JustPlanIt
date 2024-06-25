import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchResponse(String url, String text) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "prompt": text,
    }),
  );

  if (response.statusCode == 200) {
    // Jeśli serwer zwróci odpowiedź 200 OK, zwróć ciało odpowiedzi.
    debugPrint("code 200");
    return response.body;
  } else {
    // Jeśli serwer nie zwróci odpowiedzi 200 OK,
    // rzuć wyjątek.
    debugPrint("code ${response.statusCode}");
    throw Exception('Failed to load data');
  }
}
