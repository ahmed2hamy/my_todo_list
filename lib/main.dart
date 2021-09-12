import 'package:flutter/material.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/features/home_screen/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: kAppThemeData,
      home: const HomeScreen(),
    );
  }
}
