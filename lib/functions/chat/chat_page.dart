import 'package:calend/functions/generate_plan/http/http_functions.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController controller = TextEditingController();
  String response = 'Response will appear here';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'http://localhost:4000/generate', controller.text);
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
      ],
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
        labelText: 'What do you want to plan?',
        hintText: 'I want to learn CSS in 3 weeks.',
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
      //child: List,
    );
  }
}
