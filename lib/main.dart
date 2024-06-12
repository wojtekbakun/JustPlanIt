import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String response = 'Response will appear here';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PromptField(
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await fetchResponse(
                        'http://localhost:3000/chat', controller.text);
                    setState(() {
                      response = result;
                    });
                  } catch (e) {
                    setState(() {
                      response = 'Failed to fetch data: $e';
                    });
                  }
                },
                child: const Text('Send Prompt'),
              ),
            ),
            ResponseBox(
              response: response,
            ),
          ],
        ),
      ),
    );
  }
}

class PromptField extends StatelessWidget {
  final TextEditingController controller;
  const PromptField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Prompt',
        hintText: 'Enter a prompt',
      ),
    );
  }
}

class ResponseBox extends StatelessWidget {
  final String response;
  const ResponseBox({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(response),
    );
  }
}

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
