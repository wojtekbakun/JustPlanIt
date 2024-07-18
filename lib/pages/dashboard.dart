import 'package:calend/service/event_service.dart';
import 'package:calend/utils/step_radio.dart';
import 'package:calend/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/widgets/tiles/tile_steps/tile_steps.dart';
import 'package:calend/widgets/tiles/tile_prompt/tile_prompt.dart';
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
    StepService eventService = StepService();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: eventService.getLatestEventId(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                          debugPrint('latestEvent: $latestEvent');
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
                    StreamBuilder(
                      stream: eventService.getSteps(latestEvent ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final steps = snapshot.data;
                          return TileEvent(
                            event: steps?.length == 1
                                ? null
                                : steps?[
                                    context.watch<RadioStep>().selectedStep],
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    const TilePrompt(),
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
