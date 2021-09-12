import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/models/success_model.dart';
import 'package:my_todo_list/core/network/network_info.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/local/todo_local_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/remote/todo_remote_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';

// typedef _ConcreteOrRandomChooser = Future<SuccessModel> Function();

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TodoModel>>> getAllTodos() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SuccessModel>> addTodoEvent(Todo todo) async {
    throw UnimplementedError();
  }
}
