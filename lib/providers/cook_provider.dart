import 'package:flutter/material.dart';
import 'package:foobies_app/data/models/edamam/edamam_model.dart';
import 'package:foobies_app/data/repository/edamam_repository.dart';
import 'package:foobies_app/di/service_locator.dart';

class CookProvider with ChangeNotifier {
  final List<IngredientFilter> _ingredients = [
    IngredientFilter(id: 0, name: 'Chicken'),
    IngredientFilter(id: 1, name: 'Egg'),
    IngredientFilter(id: 2, name: 'Fish'),
    IngredientFilter(id: 3, name: 'Meat'),
    IngredientFilter(id: 4, name: 'Pasta'),
    IngredientFilter(id: 5, name: 'Rice'),
    IngredientFilter(id: 6, name: 'Bacon'),
    IngredientFilter(id: 7, name: 'Mushroom'),
    IngredientFilter(id: 8, name: 'Onion'),
    // 'Spinach', 'Peperoni','Sausage','Cheese'
  ];

  final List<String> _mealTypes = [
    '',
    'breakfast',
    'brunch',
    'lunch/dinner',
    'snack',
    'teatime',
  ];

  final List<String> _dietLabels = [
    '',
    'Balanced',
    'High-Fiber',
    'High-Protein',
    'Low-Carb',
    'Low-Fat',
    'Low-Sodium',
  ];

  List<IngredientFilter> get ingredients => List.unmodifiable(_ingredients);
  List<String> get mealTypes => List.unmodifiable(_mealTypes);
  List<String> get dietLabels => List.unmodifiable(_dietLabels);

  /// Notifier Ingredients
  final ValueNotifier<bool> ingredientsExpanded = ValueNotifier<bool>(false);
  final ValueNotifier<List<String>> ingredientsString = ValueNotifier([]);

  /// Notifier Meal Types
  final ValueNotifier<String> mealTypeString = ValueNotifier('');
  final ValueNotifier<bool> mealTypeExpanded = ValueNotifier<bool>(false);

  /// Notifier Diet Labels
  final ValueNotifier<String> dietLabelsString = ValueNotifier('');
  final ValueNotifier<bool> dietLabelsExpanded = ValueNotifier<bool>(false);

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  void updateIngredientsString(bool valueBool, String name) {
    if (valueBool) {
      ingredientsString.value.add(name);
    } else {
      ingredientsString.value.removeWhere((element) => element == name);
    }

    ingredientsString.notifyListeners();
  }

  final EdamamRepository _edamamRepository = getIt.get<EdamamRepository>();
  EdamamModel? _cookEdamam;

  EdamamModel? get cookEdamam => _cookEdamam;

  Future<void> searchRecipeFiltered({
    required void Function(String errorMsg) onError,
  }) async {
    if (ingredientsString.value.isEmpty) {
      onError('Ingredients can not be empty');
      isLoading.value = false;
      isLoading.notifyListeners();
      return;
    }
    try {
      final List<String> ingredients = _ingredients
          .where((element) => element.isFilterActive == true)
          .map((e) => e.name)
          .toList();
      _cookEdamam = await _edamamRepository.getRecipeFiltered(
        ingredients: ingredients,
        mealType: mealTypeString.value,
        dietLabels: dietLabelsString.value,
      );
    } catch (e) {
      onError(e.toString());
    }
    isLoading.value = false;
    isLoading.notifyListeners();
    notifyListeners();
  }
}

class IngredientFilter with ChangeNotifier {
  final int id;
  final String name;
  bool isFilterActive;

  IngredientFilter({
    required this.id,
    required this.name,
    this.isFilterActive = false,
  });

  void toggleFilterActive(bool value) {
    // print(value);
    isFilterActive = value;
    notifyListeners();
  }
}
