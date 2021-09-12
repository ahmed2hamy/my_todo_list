import 'package:flutter/material.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/core/widgets/dialogs.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;

  const TodoListTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.title),
      // onDismissed: (_) {
      //   // provider.deleteIndex(index: ind);
      //   Dialogs.buildSnackBar(context, Strings.itemDeleted);
      // },
      background: Container(color: Colors.red),
      child: ListTile(
        title: Text(
          todo.title,
          style: kBodyText.copyWith(
            color: Colors.black,
            decoration: todo.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: todo.isChecked,
          onChanged: (isChecked) {
            // provider.updateList(todo);
          },
        ),
      ),
    );
  }
}
