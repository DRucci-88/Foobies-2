import 'package:dio/dio.dart';
import 'package:foobies_app/data/network/api/constant/edamam_const.dart';

import 'package:foobies_app/data/network/api/edamam_dio_client.dart';

class EdamamApi {
  final EdamamDioClient edamamDioClient;

  EdamamApi({required this.edamamDioClient});

  /// https://developer.edamam.com/edamam-docs-recipe-api#/
  /// q = Ingredient Name

  Future<Response> getRecipe({required String q}) async {
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

  /// https://api.edamam.com/api/recipes/v2?type=public&q=Chicken%20Egg&app_id=3f4f310f&app_key=a3fd0d28cd6a2b5c664de96da482a7c1
  /// https://api.edamam.com/api/recipes/v2?type=public&q=egg&app_id=3f4f310f&app_key=a3fd0d28cd6a2b5c664de96da482a7c1&diet=high-protein&mealType=Breakfast
  /// https://api.edamam.com/api/recipes/v2?type=public&q=egg&app_id=3f4f310f&app_key=a3fd0d28cd6a2b5c664de96da482a7c1&diet=high-protein
  Future<Response> getRecipeFiltered({
    required List<String> q,
    required String mealType,
    required String dietLabels,
  }) async {
    String qUrl = '';
    for (int i = 0; i < q.length; i++) {
      qUrl = '$qUrl ${q[i].toLowerCase()}';
    }
    Map<String, String> queryParams = {
      'type': 'public',
      'app_id': EdamamConst.appid,
      'app_key': EdamamConst.appkey,
      'q': qUrl
    };
    if (mealType != '') {
      queryParams.addEntries({'mealType': mealType.toLowerCase()}.entries);
    }
    if (dietLabels != '') {
      queryParams.addEntries({'diet': dietLabels.toLowerCase()}.entries);
    }
    print(queryParams);
    try {
      final Response res = await edamamDioClient.get(
        EdamamConst.endpoint,
        queryParameters: queryParams,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
