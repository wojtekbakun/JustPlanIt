import 'package:calend/service/http_service.dart';
import 'package:calend/utils/step_radio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/event.dart';

class TilePrompt extends StatefulWidget {
  const TilePrompt({super.key});

  @override
  State<TilePrompt> createState() => _TilePromptState();
}

class _TilePromptState extends State<TilePrompt> {
  bool isHovering = false;
  final TextEditingController controller = TextEditingController();

  List<EventModel> eventslist = [];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: TilePromptContent(
        isHovering: isHovering,
        controller: controller,
        onPressed: () {
          context.read<RadioStep>().selectStep(0);
          HttpService(baseUrl: 'http://localhost:4000')
              .post('/generatePlan', {'userInput': controller.text});
        },
      ),
    );
  }

  void _onHover(bool hovering) {
    setState(() {
      isHovering = hovering;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class TilePromptContent extends StatelessWidget {
  final bool isHovering;
  final TextEditingController controller;
  final VoidCallback onPressed;
  const TilePromptContent({
    super.key,
    required this.isHovering,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium1,
      curve: Curves.easeInOut,
      height: 80,
      width: isHovering ? 400 : 180,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHovering
              ? Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'What should I plan for you?',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'Just plan it',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
