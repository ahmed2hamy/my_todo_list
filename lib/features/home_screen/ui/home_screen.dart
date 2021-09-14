import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/core/ui/widgets/dialogs.dart';
import 'package:my_todo_list/features/home_screen/ui/cubit/cubit/todo_cubit.dart';
import 'package:my_todo_list/features/home_screen/ui/widgets/add_todo.dart';
import 'package:my_todo_list/features/home_screen/ui/widgets/todo_list.dart';
import 'package:my_todo_list/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = sl<Connectivity>().onConnectivityChanged.listen((_) {
      BlocProvider.of<TodoCubit>(context).getAllTodos();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TodoCubit cubit = BlocProvider.of<TodoCubit>(context);
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTodo(cubit: cubit),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 40,
                  ),
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
                SizedBox(height: 20),
                Text(Strings.appName, style: kTitleText),
                // Text(
                //   '${Provider.of<TaskData>(context).taskCount} Tasks',
                //   style: kBodyText,
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: BlocBuilder<TodoCubit, TodoCubitState>(
                bloc: sl<TodoCubit>(),
                builder: (context, state) {
                  if (state is TodoCubitLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TodoCubitLoadedState) {
                    return TodoList(todosList: state.todosList);
                  } else if (state is TodoCubitErrorState) {
                    Dialogs.buildSnackBar(context, state.message);
                    return Container();
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
