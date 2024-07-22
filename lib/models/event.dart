import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final int taskNumber;
  final String timezone;
  final String startDate;
  final String endDate;
  final String? resourceLink;
  final String? resourceLinkTitle;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.taskNumber,
    required this.timezone,
    required this.startDate,
    required this.endDate,
    this.resourceLink,
    this.resourceLinkTitle,
  });

  factory EventModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EventModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      taskNumber: data['taskNumber'] ?? 0,
      timezone: data['timezone'] ?? '',
      startDate: data['startDate'] ?? '',
      endDate: data['endDate'] ?? '',
      resourceLink: data['resourceLink'],
      resourceLinkTitle: data['resourceLinkTitle'],
    );
  }
}
