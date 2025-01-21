import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    // define the function type based on the inner most function's return type child aka withConverter class
    // R => type or else unknown
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot
              .data()!), // gives document snapshot of data not the data directly
          toFirestore: (event, _) => event.toFireStore(),
        ); //creates collection if none exists with that name
  }

  static Future<void> addEventToFireStore(Event event) {
    CollectionReference<Event> collectionRef =
        getEventCollection(); // collection
    DocumentReference<Event> docRef = collectionRef.doc(); // document
    event.id = docRef.id; // auto id since I didn't specify a path, hover on collectionRef.doc()
    // or use event.id = getEventCollection().doc().set(event); directly
    return docRef.set(event);
  }
}
