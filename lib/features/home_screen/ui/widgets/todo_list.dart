import 'package:flutter/material.dart';
import 'package:my_todo_list/features/home_screen/ui/cubit/cubit/todo_cubit.dart';
import 'package:my_todo_list/features/home_screen/ui/widgets/todo_list_tile.dart';

class TodoList extends StatelessWidget {
  final TodoCubitLoadedState state;

  const TodoList({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.todosList.length,
      itemBuilder: (context, index) {
        return TodoListTile(todo: state.todosList[index]);
      },
    );
  }
}
