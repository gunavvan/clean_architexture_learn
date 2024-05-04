import 'package:clean_architecture_learning/feature/test/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class UserRepository {
  Future<Either<Failure,User>> getUser(int id);
  Future<Either<Failure,List<User>>> getAllUsers(int page);
}
