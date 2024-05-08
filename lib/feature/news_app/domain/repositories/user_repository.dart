import 'package:clean_architecture_learning/core/data_state.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getHomeSection();
}