import 'package:calend/features/core/models/event.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<EventModel> _events = [];
  List<EventModel> get events => _events;

  void addEvent(EventModel event) {
    _events.add(event);
    notifyListeners();
  }
}
