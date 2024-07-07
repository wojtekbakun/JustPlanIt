import "package:calend/functions/generate_plan/presentation/event_card.dart";
import "package:flutter/material.dart";
import "package:timeline_tile/timeline_tile.dart";

class MyTimelineTile extends StatelessWidget {
  final bool? isFirst;
  final bool? isLast;
  final bool? isPast;

  final String title;
  final String description;
  final String startDate;
  final String endDate;

  final String resourceLink;
  const MyTimelineTile(
      {super.key,
      this.isFirst,
      this.isLast,
      this.isPast,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.resourceLink});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      endChild: EventCard(
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        resourceLink: resourceLink,
      ),
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
    );
  }
}
