import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/error/exceptions.dart';
import 'package:my_todo_list/core/error/failures.dart';
import 'package:my_todo_list/core/network/network_info.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/local/todo_local_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/remote/todo_remote_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/models/todo_model.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';

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
  Future<Either<Failure, List<TodoModel>>> getAllTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final todoList = await remoteDataSource.getAllTodosRemotely();
        return Right(todoList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final localTrivia = await localDataSource.getAllTodosLocally();
      //   return Right(localTrivia);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> addTodoEvent(
      TodoModel todoModel) async {
    if (await networkInfo.isConnected) {
      try {
        final todoList = await remoteDataSource.addTodoRemotely(todoModel);
        return Right(todoList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final localTrivia = await localDataSource.getAllTodosLocally();
      //   return Right(localTrivia);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      return Left(ServerFailure());
    }
  }
}
