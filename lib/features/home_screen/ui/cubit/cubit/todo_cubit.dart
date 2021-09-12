import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/constants/constants.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/usecases/usecase.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/domain/usecases/add_todo_event_use_case.dart';
import 'package:my_todo_list/features/home_screen/domain/usecases/get_all_todos_use_case.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoCubitState> {
  final AddTodoEventUseCase addTodoEvent;
  final GetAllTodosUseCase getTodosEvent;

  TodoCubit({
    required this.addTodoEvent,
    required this.getTodosEvent,
  }) : super(TodoCubitInitialState());

  Future addTodo(Todo todo) async {
    emit(TodoCubitLoadingState());

    final failureOrSuccess = await addTodoEvent(Params(todo: todo));

    failureOrSuccess.fold(
        (failure) => emit(TodoCubitErrorState(_mapFailureToMessage(failure))),
        (suc) => emit(TodoCubitSuccessState(suc.successMessage)));
  }

  Future getAllTodos() async {
    emit(TodoCubitLoadingState());

    final failureOrTodos = await getTodosEvent(NoParams());

    failureOrTodos.fold(
      (failure) => emit(TodoCubitErrorState(_mapFailureToMessage(failure))),
      (todos) => emit(TodoCubitLoadedState(todos)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Strings.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return Strings.CACHE_FAILURE_MESSAGE;
      default:
        return Strings.GENARIC_FAILURE_MESSAGE;
    }
  }
}
