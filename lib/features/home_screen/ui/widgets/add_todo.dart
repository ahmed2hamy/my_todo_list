import 'package:flutter/material.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/features/home_screen/ui/provider/todos_provider.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String todoTitle = "";

    return Container(
      color: kBottomSheetBackgroundColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              Strings.addTodo,
              textAlign: TextAlign.center,
              style: kHeadText,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val) {
                todoTitle = val;
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (todoTitle.isNotEmpty) {
                  Provider.of<TodosProvider>(context)
                      .addToList(title: todoTitle);
                  Navigator.pop(context);
                }
              },
              child: const Text(Strings.add, style: kBodyText),
            ),
          ],
        ),
      ),
    );
  }
}
