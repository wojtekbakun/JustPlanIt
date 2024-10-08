import 'package:calend/core/constants/decorations.dart';
import 'package:calend/data/models/event.dart';
import 'package:flutter/material.dart';

class SingleDayTile extends StatelessWidget {
  final DateTime date;
  final List<EventModel> events;
  const SingleDayTile({super.key, required this.date, required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 660,
        width: 320,
        decoration: AppDecorations.lightContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${date.day}.${date.month}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Saturday',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  // Daily events
                  // Two columns - one for time, one for event
                  Row(
                    children: [
                      Column(
                        children: [
                          // Text(
                          //   '${events[0].title}',
                          //   style: Theme.of(context).textTheme.labelMedium,
                          // ),
                          // Text(
                          //   '${events[0].description}',
                          //   style: Theme.of(context).textTheme.labelMedium,
                          // ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
