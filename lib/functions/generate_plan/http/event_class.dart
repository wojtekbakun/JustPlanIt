import 'dart:convert';

class Event {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String resourceLink;

  Event({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.resourceLink,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
      startDate: json['start-date'],
      endDate: json['end-date'],
      resourceLink: json['resource-link'],
    );
  }
}

List<Event> decodeEvents(String jsonString) {
  final parsed = json.decode(jsonString);
  final eventsJson = parsed['events'] as List<dynamic>;
  return eventsJson.map((eventJson) => Event.fromJson(eventJson)).toList();
}
