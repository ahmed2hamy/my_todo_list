import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/models/success_model.dart';
import 'package:my_todo_list/core/usecases/usecase.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';

class AddTodoEvent implements UseCase<SuccessModel, Params> {
  final TodoRepository repository;

  AddTodoEvent(this.repository);

  @override
  Future<Either<Failure, SuccessModel>> call(Params params) async {
    return await repository.addTodoEvent(params.todo);
  }
}

class Params extends Equatable {
  final Todo todo;

  const Params({required this.todo});

  @override
  List<Object> get props => [todo];
}
