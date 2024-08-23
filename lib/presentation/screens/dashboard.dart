import 'package:calend/data/models/event.dart';
import 'package:calend/data/providers/events.dart';
import 'package:calend/data/providers/step_radio.dart';
import 'package:calend/presentation/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/presentation/widgets/tiles/tile_prompt/tile_prompt.dart';
import 'package:calend/presentation/widgets/tiles/tile_steps/tile_steps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<EventModel> eventsList = context.watch<EventsProvider>().events;
    int clickedStep = context.watch<RadioStep>().selectedStep;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            const TilePrompt(),
            TileEvent(
              event:
                  eventsList.isEmpty ? null : eventsList[0].events[clickedStep],
            ),
            TileSteps(
              steps: eventsList.isEmpty ? [] : eventsList[0].events,
              title: eventsList.isEmpty ? '' : eventsList[0].eventName,
              clickedStep: clickedStep,
            )
          ],
        ));
  }
}
