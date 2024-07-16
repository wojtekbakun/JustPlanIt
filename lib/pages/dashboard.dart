import 'package:calend/service/event_service.dart';
import 'package:calend/widgets/tiles/tile_events.dart';
import 'package:calend/widgets/tiles/tile_prompt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:timeline_tile/timeline_tile.dart";

import '../models/event.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const eventsy = [
      SingleEventPoint(
        isFirst: true,
        title: 'First do it',
        date: '19.09.2024',
      ),
      SingleEventPoint(
        isActive: true,
        title: 'Then do this',
        date: '20.09.2024',
      ),
      SingleEventPoint(
        isActive: false,
        title: 'Then do this and no more',
        date: '20.09.2024',
      ),
      SingleEventPoint(
        isActive: false,
        title: 'Then do this and no more',
        date: '20.09.2024',
      ),
      SingleEventPoint(
        isActive: false,
        title: 'Then do this and no more',
        date: '20.09.2024',
      ),
      SingleEventPoint(
        isActive: false,
        title: 'Then do this and no more',
        date: '20.09.2024',
      ),
      SingleEventPoint(
        isLast: true,
        title: 'And finally do that',
        date: '21.09.2024',
      ),
    ];

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
          ],
        ),
      ),
    );
  }
}

class SingleEventPoint extends StatelessWidget {
  final bool? isActive;
  final bool? isFirst;
  final bool? isLast;
  final String title;
  final String date;

  const SingleEventPoint({
    super.key,
    this.isActive,
    this.isFirst,
    this.isLast,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
      beforeLineStyle: LineStyle(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      afterLineStyle: LineStyle(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      indicatorStyle: IndicatorStyle(
        width: 4,
        color: Theme.of(context).colorScheme.surfaceContainer,
        indicator: Container(
          color: isActive ?? false
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : Theme.of(context).colorScheme.surfaceContainer,
        ),
      ),
      endChild: SingleEventCard(
        title: title,
        date: date,
      ),
    );
  }
}

class SingleEventCard extends StatelessWidget {
  final String title;
  final String date;
  const SingleEventCard({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          Text(date, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
