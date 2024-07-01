import 'package:calend/functions/chat/chat_page.dart';
import 'package:calend/functions/generate_plan/presentation/timeline_builder.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            ChatWidget(),
            MyTimelineTile(
                title: 'title', description: 'description', date: 'date')
          ],
        ),
      ),
    );
  }
}
