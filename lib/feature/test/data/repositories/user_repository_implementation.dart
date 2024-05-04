import 'package:clean_architecture_learning/feature/test/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImplementation extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final HiveInterface hive;

  UserRepositoryImplementation(this.userRemoteDataSource, this.userLocalDataSource, this.hive);

  @override
  Future<Either<Failure, List<User>>> getAllUsers(int page) async{
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        final localData = await userLocalDataSource.getAllUsers(page);
        return Right(localData);
      } else {
        final remoteData = await userRemoteDataSource.getAllUsers(page);
        // userLocalDataSource.cacheUsers(remoteData);
        hive.openBox('users').then((value) {
          value.put('getAllUsers', remoteData);
        });
        return Right(remoteData);
      }
    } on Exception {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        final localData = await userLocalDataSource.getUser(id);
        return Right(localData);
      } else {
        final remoteData = await userRemoteDataSource.getUser(id);
        // userLocalDataSource.cacheUsers(remoteData);
        hive.openBox('users').then((value) {
          value.put('getUsers', remoteData);
        });
        return Right(remoteData);
      }
    } on Exception {
      return Left(Failure());
    }
  }
 
}
