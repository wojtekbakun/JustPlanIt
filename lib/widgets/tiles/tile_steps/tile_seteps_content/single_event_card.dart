import 'package:flutter/material.dart';

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
