import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class  GetAllUserUseCase {
  final UserRepository _userRepository;

  GetAllUserUseCase(this._userRepository);

  Future<Either<Failure, List<User>>> execute(int page) async{
    return await _userRepository.getAllUsers(page);
  }
}