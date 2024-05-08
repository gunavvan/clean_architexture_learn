import 'package:clean_architecture_learning/core/usecase/usecase.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/entities/user.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/repositories/user_repository.dart';

import '../../../../core/data_state.dart';
import '../../../test/domain/entities/user.dart';

class GetUserUseCase implements Usecase<DataState<List<UserEntity>>, void> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return userRepository.getHomeSection();
  }

}