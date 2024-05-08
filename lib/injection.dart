import 'package:clean_architecture_learning/feature/news_app/data/data_sources/remote_data_source/api_service.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/repositories/user_repository.dart';
import 'package:clean_architecture_learning/feature/news_app/presentation/bloc/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'feature/news_app/data/repositories/user_repository_impl.dart';
import 'feature/news_app/domain/use_cases/user_usecase.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  // / Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  //dependencies
  locator.registerLazySingleton<ApiService>(() => ApiService(locator()));

  // UseCase
  locator.registerLazySingleton(() => GetUserUseCase(locator()));

  // Repository
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator()));

  // Bloc
  locator.registerFactory<UserBloc>(() => UserBloc(locator()));

  // Data Source
  // locator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());

}