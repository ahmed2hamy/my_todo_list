import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/core/domain/error/exceptions.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<void> addTodoRemotely(TodoModel todo);

  Future<List<TodoModel>> getAllTodosRemotely();

  Future<void> sendCachedTodoListToApi(List<TodoModel> todos);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore db;
  final List<TodoModel> _todosList = [];

  TodoRemoteDataSourceImpl(this.db);

  @override
  Future<void> addTodoRemotely(TodoModel todo) async {
    try {
      await db
          .collection(kCollectionName)
          .doc(todo.title + todo.dateCreated.toString())
          .set(
            todo.toJson(),
            SetOptions(merge: true),
          );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getAllTodosRemotely() async {
    try {
      _todosList.clear();
      CollectionReference todosCollection = db.collection(kCollectionName);

      QuerySnapshot snapshot = await todosCollection.get();
      for (var e in snapshot.docs) {
        Map<String, dynamic> json = (e.data() ?? {}) as Map<String, dynamic>;
        TodoModel todo = TodoModel.fromJson(json);
        _todosList.add(todo);
      }
      return _todosList;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> sendCachedTodoListToApi(List<TodoModel> todos) async {
    for (var todo in todos) {
      await addTodoRemotely(todo);
    }
  }
}
