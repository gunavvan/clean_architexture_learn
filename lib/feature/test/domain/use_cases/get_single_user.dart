import 'package:clean_architecture_learning/core/failure.dart';

import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetSingleUserUseCase {
  final UserRepository _userRepository;

  GetSingleUserUseCase(this._userRepository);

  Future<Either<Failure, User>> execute(int id) async{
    return await _userRepository.getUser(id);
  }
}