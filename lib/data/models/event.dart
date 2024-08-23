class EventDetail {
  final int taskNumber;
  final String title;
  final String description;
  final String resourceLink;
  final String resourceLinkTitle;
  final String startDate;
  final String endDate;

  EventDetail({
    required this.taskNumber,
    required this.title,
    required this.description,
    required this.resourceLink,
    required this.resourceLinkTitle,
    required this.startDate,
    required this.endDate,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) {
    return EventDetail(
      taskNumber: json['taskNumber'],
      title: json['title'],
      description: json['description'],
      resourceLink: json['resourceLink'],
      resourceLinkTitle: json['resourceLinkTitle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}

class EventModel {
  //final String id;
  final String eventName;
  final List<dynamic> events;

  EventModel({
    //required this.id,
    required this.eventName,
    required this.events,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    var eventsList = json['generatedPlan']['events'] as List;
    List<EventDetail> events =
        eventsList.map((e) => EventDetail.fromJson(e)).toList();

    return EventModel(
      //id: json['id'],
      eventName: json['generatedPlan']['eventName'],
      events: events,
    );
  }
}
