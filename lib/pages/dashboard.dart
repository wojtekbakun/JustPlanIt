import 'package:calend/models/event.dart';
import 'package:calend/service/event_service.dart';
import 'package:calend/utils/step_radio.dart';
import 'package:calend/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/widgets/tiles/tile_single_day/tile_single_day.dart';
import 'package:calend/widgets/tiles/tile_steps/tile_steps.dart';
import 'package:calend/widgets/tiles/tile_prompt/tile_prompt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<EventModel> myEvents = [
  EventModel(
    id: '1',
    title: 'Event 1',
    description: 'Description 1',
    taskNumber: 1,
    timezone: 'UTC',
    startDate: '2024-07-20T08:00:00',
    endDate: '2024-07-20T09:00:00',
    resourceLink: 'https://www.google.com',
    resourceLinkTitle: 'Google',
  ),
  EventModel(
    id: '2',
    title: 'Event 2',
    description: 'Description 2',
    taskNumber: 2,
    timezone: 'UTC',
    startDate: '2024-07-20T10:00:00',
    endDate: '2024-07-20T11:00:00',
    resourceLink: 'https://www.google.com',
    resourceLinkTitle: 'Google',
  ),
  EventModel(
    id: '3',
    title: 'Event 3',
    description: 'Description 3',
    taskNumber: 3,
    timezone: 'UTC',
    startDate: '2024-07-20T12:00:00',
    endDate: '2024-07-20T13:00:00',
    resourceLink: 'https://www.google.com',
    resourceLinkTitle: 'Google',
  ),
];

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    StepService eventService = StepService();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: eventService.getLatestEventId(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.docs.isEmpty ?? true) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('No events found'),
                      TilePrompt(),
                    ],
                  ),
                );
              }
              final latestEvent = snapshot.data?.docs[0].id;
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Steps
                    StreamBuilder(
                      stream: eventService.getSteps(latestEvent ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final steps = snapshot.data!;
                          return TileSteps(
                            title: latestEvent,
                            steps: steps,
                            clickedStep: context
                                .watch<RadioStep>()
                                .selectedStep, //TODO: implement click
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),

                    // Event
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder(
                          stream: eventService.getSteps(latestEvent ?? ''),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final steps = snapshot.data;
                              return TileEvent(
                                event: steps?.length == 1
                                    ? null
                                    : steps?[context
                                        .watch<RadioStep>()
                                        .selectedStep],
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                        const TilePrompt(),
                      ],
                    ),
                    StreamBuilder(
                      stream: eventService.getEventsForTheDate(
                          DateTime(2024, 7, 20, 0, 0),
                          DateTime(2024, 7, 23, 23, 59)),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final events = snapshot.data;
                          debugPrint('hej ${events?[0]}');
                          return SingleDayTile(
                            date: DateTime.now(),
                            events: events ?? myEvents,
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    // SingleDayTile(date: DateTime.now(), events: myEvents)
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
