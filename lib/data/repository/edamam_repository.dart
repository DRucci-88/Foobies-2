import 'package:dio/dio.dart';
import 'package:foobies_app/data/models/edamam/edamam_model.dart';
import 'package:foobies_app/data/network/api/edamam_dio_exception.dart';
import 'package:foobies_app/data/network/api/edamam/edamam_api.dart';

class EdamamRepository {
  final EdamamApi edamamApi;
  EdamamRepository(this.edamamApi);

  Future<EdamamModel> getRecipeByIngredient(
      {required String ingredient}) async {
    try {
      final res = await edamamApi.getRecipe(q: ingredient);
      final EdamamModel edamamModel = EdamamModel.fromJson(res.data);
      return edamamModel;
    } on DioError catch (e) {
      final errorMessage = EdamamDioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<EdamamModel> getRecipeFiltered({
    required List<String> ingredients,
    required String mealType,
    required String dietLabels,
  }) async {
    try {
      final res = await edamamApi.getRecipeFiltered(
        q: ingredients,
        mealType: mealType,
        dietLabels: dietLabels,
      );
      final EdamamModel edamamModel = EdamamModel.fromJson(res.data);
      return edamamModel;
    } on DioError catch (e) {
      final errorMessage = EdamamDioExceptions.fromDioError(e).toString();
      print('LER $errorMessage');
      throw errorMessage;
    }
  }
}
