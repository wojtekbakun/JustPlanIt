import 'package:calend/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final CollectionReference _events =
      FirebaseFirestore.instance.collection('/events');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference _getPath(String id) {
    CollectionReference path = _firestore.collection('/events/$id/steps');
    return path;
  }

  Stream<List<Event>> getSteps(String latestEvent) {
    return _getPath(latestEvent).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromDocument(doc)).toList();
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
}
