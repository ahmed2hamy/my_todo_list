import 'package:get_it/get_it.dart';


import 'core/network/network_info.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // // Bloc
  // sl.registerFactory(
  //       () => NumberTriviaBloc(
  //     concrete: sl(),
  //     inputConverter: sl(),
  //     random: sl(),
  //   ),
  // );
  //
  // // Use cases
  // sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  // sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));
  //
  // // Repository
  // sl.registerLazySingleton<NumberTriviaRepository>(
  //       () => NumberTriviaRepositoryImpl(
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );
  //
  // // Data sources
  // sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  //       () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  // );
  //
  // sl.registerLazySingleton<NumberTriviaLocalDataSource>(
  //       () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  // );
  //
  // //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //
  // //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
