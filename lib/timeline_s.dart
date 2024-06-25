import "package:calend/event_card.dart";
import "package:flutter/material.dart";
import "package:timeline_tile/timeline_tile.dart";

class MyTimelineTile extends StatelessWidget {
  final bool? isFirst;
  final bool? isLast;
  final bool? isPast;

  final String title;
  final String description;
  final String date;
  const MyTimelineTile(
      {super.key,
      this.isFirst,
      this.isLast,
      this.isPast,
      required this.title,
      required this.description,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      endChild: EventCard(
        title: title,
        description: description,
        date: date,
      ),
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
    );
  }
}
