import 'package:calend/models/event.dart';
import 'package:flutter/material.dart';

class TileEvent extends StatelessWidget {
  final String? title;
  final Event? event;
  const TileEvent({super.key, this.title, this.event});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 320,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                event?.title ?? 'Waiting for event',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              child: Text(
                event?.description ?? 'No description',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(
              event?.resourceLinkTitle ?? 'No resource link',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
