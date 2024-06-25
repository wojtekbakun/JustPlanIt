import 'package:calend/chat_page.dart';
import 'package:calend/timeline_s.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ChatWidget(),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: readJsonFile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Dane zostały załadowane
                    final events = snapshot.data!;
                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return MyTimelineTile(
                          isFirst: index == 0,
                          isLast: index == events.length - 1,
                          title: event["title"],
                          description: event["description"],
                          date: event["start-time"],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> readJsonFile() async {
  try {
    String jsonString = await rootBundle.loadString('assets/events.json');
    List<dynamic> data = json.decode(jsonString);
    return data;
  } catch (e) {
    print('Error reading JSON file: $e');
    return [];
  }
}
