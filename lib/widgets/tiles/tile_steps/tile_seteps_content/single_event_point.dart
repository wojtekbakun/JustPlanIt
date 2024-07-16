import 'package:calend/widgets/tiles/tile_steps/tile_seteps_content/single_event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
