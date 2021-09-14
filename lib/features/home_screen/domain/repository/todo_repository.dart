import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/domain/error/failures.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> getAllTodosEvent();
  Future<Either<Failure, List<TodoModel>>> addTodoEvent(TodoModel todo);
}
