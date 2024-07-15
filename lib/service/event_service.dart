import 'package:calend/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final CollectionReference _firestore = FirebaseFirestore.instance
      .collection('/events/Love Letter Mastery/steps/');

  Stream<List<Event>> getEvents() {
    return _firestore.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromDocument(doc)).toList();
    });
  }
}
