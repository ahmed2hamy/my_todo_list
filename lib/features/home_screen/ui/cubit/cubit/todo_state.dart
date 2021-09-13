part of 'todo_cubit.dart';

abstract class TodoCubitState extends Equatable {
  const TodoCubitState();

  @override
  List<Object> get props => [];
}

class TodoCubitInitialState extends TodoCubitState {}

class TodoCubitLoadingState extends TodoCubitState {}

class TodoCubitLoadedState extends TodoCubitState {
  final List<Todo> todosList;

  const TodoCubitLoadedState(this.todosList);

  @override
  List<Object> get props => [todosList];
}

class TodoCubitErrorState extends TodoCubitState {
  final String message;

  const TodoCubitErrorState(this.message);

  @override
  List<Object> get props => [message];
}
