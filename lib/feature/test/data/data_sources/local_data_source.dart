import 'package:clean_architecture_learning/feature/test/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
abstract class UserLocalDataSource {
  Future<DataUser> getUser(int id);

  Future<List<DataUser>> getAllUsers(int page);
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final dio = Dio();
  final HiveInterface hive;

  UserLocalDataSourceImpl(this.hive);

  @override
  Future<List<DataUser>> getAllUsers(int page)async {
    // TODO: implement getUser
    var box = await hive.openBox('users');
    return box.get('getAllUsers');
  }

  @override
  Future<DataUser> getUser(int id) async {
    // TODO: implement getUser
    var box = await hive.openBox('users');
    return box.get('getUsers');
  }

}
