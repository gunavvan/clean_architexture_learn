import 'dart:io';

import 'package:clean_architecture_learning/core/data_state.dart';
import 'package:clean_architecture_learning/feature/news_app/data/data_sources/remote_data_source/api_service.dart';
import 'package:clean_architecture_learning/feature/news_app/data/models/user_models.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/entities/user.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<UserModels>>> getHomeSection() async {
    try {
      final httpResponse = await _apiService.getUsers(page: 1);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
