import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> addTodoRemotely(TodoModel todo);

  Future<List<TodoModel>> getAllTodosRemotely();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore db;
  final List<TodoModel> _todosList = [];

  TodoRemoteDataSourceImpl(this.db);

  @override
  Future<List<TodoModel>> addTodoRemotely(TodoModel todo) async {
    try {
      await db.collection(kCollectionName).add(todo.toJson());
      List<TodoModel> todos = await getAllTodosRemotely();
      return todos;
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<List<TodoModel>> getAllTodosRemotely() async {
    _todosList.clear();
    CollectionReference todosCollection = db.collection(kCollectionName);

    QuerySnapshot snapshot = await todosCollection.get();
    for (var e in snapshot.docs) {
      Map<String, dynamic> json = (e.data() ?? {}) as Map<String, dynamic>;
      TodoModel todo = TodoModel.fromJson(json);
      _todosList.add(todo);
    }
    return _todosList;
  }
}
