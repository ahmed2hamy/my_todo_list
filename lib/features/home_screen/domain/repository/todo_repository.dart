import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/models/success_model.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoModel>> getAllTodos();
  Future<Either<Failure, SuccessModel>> addTodoEvent(Todo todo);
}
