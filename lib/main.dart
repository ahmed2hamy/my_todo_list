import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/features/home_screen/ui/cubit/cubit/todo_cubit.dart';
import 'package:my_todo_list/features/home_screen/ui/home_screen.dart';
import 'package:my_todo_list/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: kAppThemeData,
      home: BlocProvider<TodoCubit>(
        create: (_) => di.sl<TodoCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
