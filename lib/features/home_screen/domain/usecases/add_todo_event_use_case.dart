import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/domain/error/failures.dart';
import 'package:my_todo_list/core/domain/usecases/usecase.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';

class AddTodoEventUseCase implements UseCase<List<TodoModel>, Params> {
  final TodoRepository repository;

  AddTodoEventUseCase(this.repository);

  @override
  Future<Either<Failure, List<TodoModel>>> call(Params params) async {
    return await repository.addTodoEvent(params.todoModel);
  }
}

class Params extends Equatable {
  final TodoModel todoModel;

  const Params({required this.todoModel});

  @override
  List<Object> get props => [todoModel];
}
