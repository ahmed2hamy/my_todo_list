import 'package:flutter/material.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/core/widgets/dialogs.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/ui/provider/todos_provider.dart';
import 'package:my_todo_list/features/home_screen/ui/widgets/todo_list_tile.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.todos.length,
          itemBuilder: (context, ind) {
            final Todo todo = provider.todos[ind];

            return Dismissible(
              key: Key(todo.title),
              onDismissed: (_) {
                provider.deleteIndex(index: ind);
                Dialogs.buildSnackBar(context, Strings.itemDeleted);
              },
              background: Container(color: Colors.red),
              child: TodoListTile(
                taskName: todo.title,
                isChecked: todo.isChecked,
                checkBoxCallback: (isChecked) {
                  provider.updateList(todo);
                },
              ),
            );
          },
        );
      },
    );
  }
}
