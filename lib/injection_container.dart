import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_todo_list/core/data/local_datasource/moor/moor_helper.dart';
import 'package:my_todo_list/core/data/network/network_info.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/local/todo_local_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/data_sources/remote/todo_remote_data_source.dart';
import 'package:my_todo_list/features/home_screen/data/repositories/todo_repository_impl.dart';
import 'package:my_todo_list/features/home_screen/domain/repository/todo_repository.dart';
import 'package:my_todo_list/features/home_screen/domain/usecases/add_todo_event_use_case.dart';
import 'package:my_todo_list/features/home_screen/domain/usecases/get_all_todos_use_case.dart';
import 'package:my_todo_list/features/home_screen/ui/cubit/cubit/todo_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Services init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //! Features
  // Bloc
  sl.registerLazySingleton(
    () => TodoCubit(
      addTodoEvent: sl(),
      getTodosEvent: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddTodoEventUseCase(sl()));
  sl.registerLazySingleton(() => GetAllTodosUseCase(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => MoorHelper());
}
