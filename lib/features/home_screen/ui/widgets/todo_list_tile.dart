import 'package:flutter/material.dart';
import 'package:my_todo_list/constants/constants.dart';

class TodoListTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function(bool?) checkBoxCallback;

  const TodoListTile(
      {Key? key,
      required this.taskName,
      required this.isChecked,
      required this.checkBoxCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: kBodyText.copyWith(
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
