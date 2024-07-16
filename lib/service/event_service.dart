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

  Stream<List<Event>> getEvents() {
    return _getPath('Love Letter Mastery').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromDocument(doc)).toList();
    });
  }

  Stream<List<String>> getDocIds() {
    return _events.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.id).toList();
    });
  }
}
