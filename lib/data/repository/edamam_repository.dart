import 'package:dio/dio.dart';
import 'package:foobies_app/data/models/edamam/edamam_model.dart';
import 'package:foobies_app/data/network/api/edamam_dio_exception.dart';
import 'package:foobies_app/data/network/api/user/edamam_api.dart';

class EdamamRepository {
  final EdamamApi edamamApi;
  EdamamRepository(this.edamamApi);

  Future<EdamamModel> getRecipeRequested({String? ingredients}) async {
    try {
      final res = await edamamApi.getRecipe(q: ingredients);
      final EdamamModel edamamModel = EdamamModel.fromJson(res.data);
      return edamamModel;
    } on DioError catch (e) {
      final errorMessage = EdamamDioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
