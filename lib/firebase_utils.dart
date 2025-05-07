import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/model/event.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils{

  static CollectionReference<Event> getEventCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName).
    withConverter<Event>(
        fromFirestore: (snapshot,_)=>Event.FromFireStore(snapshot.data()!),
        toFirestore: (event,_)=>event.toFireStore()
    );
  }
  static Future<void> addEventToFireStore(Event event){
    var collection = getEventCollection(); //collection
    var docRef = collection.doc();   //document
    event.id = docRef.id;  // auto id
    return docRef.set(event);
  }
}