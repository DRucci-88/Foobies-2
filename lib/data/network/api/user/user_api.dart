import 'package:foobies_app/data/network/api/constant/edamam_const.dart';
import 'package:foobies_app/data/network/api/dio_client.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> addUserApi(String name, String job) async {
    try {
      final Response response = await dioClient.post(
        EdamamConst.users,
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUsersApi() async {
    try {
      final Response response = await dioClient.get(EdamamConst.users);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUserApi(int id, String name, String job) async {
    try {
      final Response response =
          await dioClient.put('${EdamamConst.users}/$id', data: {
        'name': name,
        'job': job,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserApi(int id) async {
    try {
      await dioClient.delete('${EdamamConst.users}/$id');
    } catch (e) {
      rethrow;
    }
  }
}
