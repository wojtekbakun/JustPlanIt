import 'package:calend/utils/event_date.dart';
import 'package:calend/widgets/tiles/tile_steps/tile_seteps_content/single_event_point.dart';
import 'package:flutter/material.dart';

class TileEvents extends StatelessWidget {
  final List? events;
  const TileEvents({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 4),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Love letters maestry',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            //timeline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: events?.isEmpty == true
                  ? const Text('No events yet')
                  : ListView.builder(
                      itemCount: events!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SingleEventPoint(
                        title: events![index].title,
                        date: EventDateUtils.getSingleEventDateAndTime(
                          events![index],
                        ),
                        isFirst: index == 0,
                        isLast: index == events!.length - 1,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
