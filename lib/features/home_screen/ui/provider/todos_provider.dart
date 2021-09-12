import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView get todos {
    return UnmodifiableListView(_todos);
  }

  void addToList({required String title}) {
    final Todo todo = Todo(title: title);
    _todos.add(todo);
    notifyListeners();
  }

  void updateList(Todo todo) {
    todo.isChecked = !todo.isChecked;
    notifyListeners();
  }

  void deleteIndex({index}) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
