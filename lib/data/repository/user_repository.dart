import 'package:dio/dio.dart';
import 'package:foobies_app/data/models/new_user.dart';
import 'package:foobies_app/data/models/user_model.dart';
import 'package:foobies_app/data/network/api/dio_exception.dart';
import 'package:foobies_app/data/network/api/user/user_api.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errormessage = DioExceptions.fromDioError(e).toString();
      throw errormessage;
    }
  }

  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final response = await userApi.addUserApi(name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errormessage = DioExceptions.fromDioError(e).toString();
      throw errormessage;
    }
  }

  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final response = await userApi.updateUserApi(id, name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errormessage = DioExceptions.fromDioError(e).toString();
      throw errormessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errormessage = DioExceptions.fromDioError(e).toString();
      throw errormessage;
    }
  }
}
