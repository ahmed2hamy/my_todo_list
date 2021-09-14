import 'package:my_todo_list/core/data/local_datasource/moor/moor_helper.dart';
import 'package:my_todo_list/core/domain/error/exceptions.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<void> addTodoLocally(TodoModel todo);

  Future<List<TodoModel>> getAllTodosLocally();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final MoorHelper helper;
  late Future<Database> _database;
  final List<TodoModel> _todosList = [];

  TodoLocalDataSourceImpl(this.helper) {
    _database = helper.database;
  }

  @override
  Future<void> addTodoLocally(TodoModel todo) async {
    try {
      final db = await _database;

      await db.into(db.todoTable).insert(
            TodoTableCompanion.insert(
              dateCreated: todo.dateCreated,
              title: todo.title,
              isChecked: todo.isChecked,
            ),
          );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<TodoModel>> getAllTodosLocally() async {
    try {
      _todosList.clear();
      final db = await _database;

      List<TodoTableData> res = await db.select(db.todoTable).get();
      for (var e in res) {
        _todosList.add(
          TodoModel(
            dateCreated: e.dateCreated,
            title: e.title,
            isChecked: e.isChecked,
          ),
        );
      }
      return _todosList;
    } catch (e) {
      throw CacheException();
    }
  }
}
