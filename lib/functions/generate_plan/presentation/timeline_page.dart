import 'package:calend/functions/chat/chat_widget.dart';
import 'package:calend/functions/generate_plan/http/event_class.dart';
import 'package:calend/functions/generate_plan/presentation/timeline_builder.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Event> events = [];
  void updateEvents(List<Event> newEvents) {
    events.clear();
    setState(() {
      for (int i = 0; i < newEvents.length; i++) {
        events.add(newEvents[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ChatWidget(updateEvents: updateEvents),
            Expanded(
              child: ListView.builder(
                  itemCount: events.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => MyTimelineTile(
                        isFirst: index == 0,
                        isLast: index == events.length - 1,
                        title: events[index].title,
                        description: events[index].description,
                        startDate: events[index].startDate,
                        endDate: events[index].endDate,
                        resourceLink: events[index].resourceLink,
                      )),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Send it to Google Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}
