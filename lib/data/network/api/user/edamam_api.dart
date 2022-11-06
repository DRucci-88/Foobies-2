import 'package:dio/dio.dart';
import 'package:foobies_app/data/network/api/constant/edamam_const.dart';

import 'package:foobies_app/data/network/api/edamam_dio_client.dart';

class EdamamApi {
  final EdamamDioClient edamamDioClient;

  EdamamApi({required this.edamamDioClient});

  Future<Response> getRecipe({String? q}) async {
    try {
      final Response res = await edamamDioClient.get(
        EdamamConst.endpoint,
        queryParameters: {
          'type': 'public',
          'app_id': EdamamConst.appid,
          'app_key': EdamamConst.appkey,
          'q': q
        },
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
