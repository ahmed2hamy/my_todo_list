import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/ui/cubit/cubit/todo_cubit.dart';

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
              onPressed: () async {
                if (todoTitle.isNotEmpty) {
                  await BlocProvider.of<TodoCubit>(context).addTodo(
                    Todo(title: todoTitle),
                  );
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
