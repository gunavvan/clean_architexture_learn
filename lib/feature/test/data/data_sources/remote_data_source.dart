import 'package:clean_architecture_learning/feature/test/data/models/user_model.dart';
import 'package:dio/dio.dart';
abstract class UserRemoteDataSource {
  Future<DataUser> getUser(int id);

  Future<List<DataUser>> getAllUsers(int page);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<DataUser>> getAllUsers(int page)async {
    // TODO: implement getUser
    var response = await dio.get("https://reqres.in/api/users?page=$page");
    var data = response.data['data'];
    List<DataUser> users = data.map<DataUser>((e) => DataUser.fromJson(e)).toList();
    return users;
  }

  @override
  Future<DataUser> getUser(int id) async {
    // TODO: implement getUser
    var response = await dio.get("https://reqres.in/api/users/$id");
    var data = response.data['data'];
    // List<UserModel> users = data.map<UserModel>((e) => UserModel.fromJson(e)).toList();
    return DataUser.fromJson(data);
  }

}
