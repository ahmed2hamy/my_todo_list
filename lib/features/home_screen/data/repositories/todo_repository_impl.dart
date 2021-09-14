import 'package:dartz/dartz.dart';
import 'package:my_todo_list/core/data/network/network_info.dart';
import 'package:my_todo_list/core/domain/error/exceptions.dart';
import 'package:my_todo_list/core/domain/error/failures.dart';
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
  Future<Either<Failure, List<TodoModel>>> getAllTodosEvent() async {
    if (await networkInfo.isConnected) {
      try {
        //Sync local todos to remote
        List<TodoModel> todos = await localDataSource.getAllTodosLocally();
        await remoteDataSource.sendCachedTodoListToApi(todos);

        //Get remote todos
        final List<TodoModel> todoList =
            await remoteDataSource.getAllTodosRemotely();

        //Sort todos list
        todoList.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));

        return Right(todoList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        //Get todos from local
        final List<TodoModel> todoList =
            await localDataSource.getAllTodosLocally();

        //Sort todos list
        todoList.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));

        return Right(todoList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> addTodoEvent(
      TodoModel todoModel) async {
    //Add TodoModel to local
    try {
      await localDataSource.addTodoLocally(todoModel);
    } on CacheException {
      return Left(CacheFailure());
    }

    //Then get the updated todos list
    final failureOrTodos = await getAllTodosEvent();

    return failureOrTodos;
  }
}
