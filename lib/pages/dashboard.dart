import 'package:calend/service/event_service.dart';
import 'package:calend/widgets/tiles/tile_steps/tile_steps.dart';
import 'package:calend/widgets/tiles/tile_prompt/tile_prompt.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    EventService eventService = EventService();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder(
              stream: eventService.getEvents(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final events = snapshot.data!;
                  return TileEvents(
                    events: events,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const TilePrompt(),
            StreamBuilder(
              stream: eventService.getDocIds(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final events = snapshot.data!;
                  return Card(
                    child: Column(
                      children: [
                        for (var event in events)
                          Text(
                            event,
                          ),
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
