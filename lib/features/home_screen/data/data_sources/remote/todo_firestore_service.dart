import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo_list/core/services/firestore_service.dart';

class TodoFirestoreService extends FirestoreService {
  TodoFirestoreService(FirebaseFirestore db) : super(db);

  @override
  CollectionReference getCollectionReference() {
    return db.collection("todos_list");
  }

  @override
  String getID() {
    return getCollectionReference().doc().id;
  }

  Stream<QuerySnapshot> getTodoList() {
    return getCollectionReference().snapshots();
  }
}
