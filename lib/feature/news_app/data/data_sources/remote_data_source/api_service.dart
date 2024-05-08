import 'package:clean_architecture_learning/core/constant/constans.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/user_models.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiService)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/users")
  Future<HttpResponse<List<UserModels>>> getUsers({
    @Query("page") int? page,
  });
}
