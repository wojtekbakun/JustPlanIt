import 'package:calend/models/event.dart';
import 'package:calend/utils/step_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StepService {
  final CollectionReference _events =
      FirebaseFirestore.instance.collection('/events');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference _getPath(String id) {
    CollectionReference path = _firestore.collection('/events/$id/steps');
    return path;
  }

//dlaczego to zwraca pusta liste
  Stream<List<EventModel>> getSteps(String latestEvent) {
    return _getPath(latestEvent).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => EventModel.fromDocument(doc)).toList();
    });
  }

  Stream<List<String>> getAllDocIds() {
    return _events
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.id).toList();
    });
  }

  Stream<QuerySnapshot> getLatestEventId() {
    final Stream<QuerySnapshot> latestId =
        _events.orderBy('createdAt', descending: true).limit(1).snapshots();
    return latestId;
  }

  Stream<List<EventModel>> getEventsForTheDate(
      DateTime startDate, DateTime endDate) {
    return _events
        .where('startDate', isGreaterThanOrEqualTo: startDate)
        .where('endDate', isLessThan: endDate)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => EventModel.fromDocument(doc)).toList();
    });
  }
}
