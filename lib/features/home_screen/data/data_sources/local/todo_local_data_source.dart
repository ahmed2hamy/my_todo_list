import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> addTodoLocally(TodoModel todo);

  Future<List<TodoModel>> getAllTodosLocally();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences prefs;

  TodoLocalDataSourceImpl(this.prefs);

  @override
  Future<List<TodoModel>> addTodoLocally(TodoModel todo) {
    // TODO: implement getAllTodosLocally
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodosLocally() {
    // TODO: implement getAllTodosLocally
    throw UnimplementedError();
  }
}
