import 'package:calend/functions/generate_plan/http/event_class.dart';
import 'package:calend/functions/generate_plan/http/http_functions.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final Function updateEvents;
  const ChatWidget({super.key, required this.updateEvents});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLoading = false;

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
          child: isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      widget.updateEvents(await fetchJsonResponse(
                          'http://localhost:4000/generate', controller.text));
                    } catch (e) {
                      setState(() {
                        //  response = 'Failed to fetch data: $e';
                      });
                    } finally {
                      setState(() {
                        isLoading = false;
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
        hintText: 'Type it here...',
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
