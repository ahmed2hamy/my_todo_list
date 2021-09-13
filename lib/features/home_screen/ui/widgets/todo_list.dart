import 'package:flutter/material.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/ui/widgets/todo_list_tile.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todosList;

  const TodoList({
    Key? key,
    required this.todosList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todosList.length,
      itemBuilder: (context, index) {
        return TodoListTile(todo: todosList[index]);
      },
    );
  }
}
