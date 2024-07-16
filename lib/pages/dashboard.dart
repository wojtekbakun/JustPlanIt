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
              stream: eventService.getLatestEventId(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final latestEvent = snapshot.data!.docs[0].id;
                  return StreamBuilder(
                    stream: eventService.getSteps(latestEvent),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final events = snapshot.data!;
                        return TileEvents(
                          events: events,
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const TilePrompt(),
          ],
        ),
      ),
    );
  }
}
