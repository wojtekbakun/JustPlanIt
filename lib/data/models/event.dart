class EventModel {
  //final String id;
  final String eventName;
  final List<Map<String, dynamic>> events;

  EventModel({
    //required this.id,
    required this.eventName,
    required this.events,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      //id: json['id'],
      eventName: json['generatedPlan']['eventName'],
      events: json['generatedPlan']['events'],
    );
  }
}

//send http request
//receive http response
//parse json
//return EventModel

