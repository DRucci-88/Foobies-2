import 'package:flutter/material.dart';
import 'package:foobies_app/data/models/edamam/edamam_model.dart';
import 'package:foobies_app/data/repository/edamam_repository.dart';
import 'package:foobies_app/di/service_locator.dart';

import '../data/models/edamam/recipe.dart';

class HomeProvider with ChangeNotifier {
  final EdamamRepository _edamamRepository = getIt.get<EdamamRepository>();

  EdamamModel? _homeEdamam;

  EdamamModel? get homeEdamam {
    if (_homeEdamam == null) {
      return null;
    }
    return _homeEdamam;
  }

  Recipe findRecipeById(int index) {
    return _homeEdamam!.hits![index].recipe!;
  }

  Future<void> homeInitial({required String ingredient}) async {
    _homeEdamam =
        await _edamamRepository.getRecipeRequested(ingredient: ingredient);
    notifyListeners();
  }

  static String parseHealthLabels(List<String> labels) {
    String labelString = '';
    for (var i = 0; i < labels.length; i++) {
      labelString += labels[i];
      if (i != labels.length - 1) {
        labelString += ' . ';
      }
    }
    return labelString;
  }
}
