import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/usecases/usecase.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';

class GetAllTodos implements UseCase<TodoModel, NoParams> {
  final TodoRepository repository;

  GetAllTodos(this.repository);

  @override
  Future<Either<Failure, TodoModel>> call(NoParams noParams) async {
    return await repository.getAllTodos();
  }
}
