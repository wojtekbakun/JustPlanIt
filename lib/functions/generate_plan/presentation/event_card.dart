import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  const EventCard(
      {super.key,
      required this.title,
      required this.description,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
