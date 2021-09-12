import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo_list/core/models/success_model.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/remote/todo_firestore_service.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<SuccessModel> addTodoRemotely(TodoModel todo);

  Future<List<TodoModel>> getAllTodosRemotely();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final TodoFirestoreService firestoreService;

  TodoRemoteDataSourceImpl(this.firestoreService);

  @override
  Future<SuccessModel> addTodoRemotely(TodoModel todo) async {
    try {
      await firestoreService.add(todo.toJson());
      return SuccessModel();
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<List<TodoModel>> getAllTodosRemotely()async {
    QuerySnapshot snapshot = await firestoreService.getTodoList();

  }

  Stream<List<TodoModel>> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }

  List<TodoModel> todoFromFirestore(QuerySnapshot snapshot) {

      return snapshot.docs.map<TodoModel>((e) {
        return TodoModel(
          title: e.data()!["title"],
        );
      }).toList();

  }



// Future _getTriviaFromUrl(String url) async {
//   final response = await client.get(
//     url,
//   );
//
//   if (response.statusCode == 200) {
//     return NumberTriviaModel.fromJson(json.decode(response.body));
//   } else {
//     throw ServerException();
//   }
// }
}
