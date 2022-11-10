import 'package:flutter/material.dart';
import 'package:foobies_app/providers/cook_provider.dart';
import 'package:foobies_app/widgets/cook/recipe_grid.dart';
import 'package:provider/provider.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  late CookProvider cookProvider;

  @override
  void initState() {
    print('Initial Cook Page');
    cookProvider = Provider.of<CookProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildListTileIngredients(context),
            _buildFilterIngredients(context),
            _buildListTileMealType(context),
            _buildFilterMealType(context),
            _buildListTileDietLabels(context),
            _buildFilterDietLabels(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(46)),
                onPressed: () {
                  cookProvider.isLoading.value = true;
                  cookProvider.searchRecipeFiltered(
                      onError: (errorMsg) => _errorSnackBar(context, errorMsg));
                },
                child: const Text('Search'),
              ),
            ),
            // const Expanded(child: RecipeGrid()),
            ValueListenableBuilder(
              valueListenable: cookProvider.isLoading,
              builder: (context, value, child) {
                if (value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Consumer<CookProvider>(
                  builder: (_, value, ___) {
                    if (value.cookEdamam != null &&
                        value.cookEdamam!.count! > 0) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RecipeGrid(),
                      );
                    }
                    return Container();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Ingredients List Tile
  Widget _buildListTileIngredients(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Ingredients'),
          ValueListenableBuilder(
            valueListenable: cookProvider.ingredientsString,
            builder: (context, value, child) {
              // value.forEach((element) => print(element));
              return Text(
                value.fold('', (prev, element) => prev += '$element '),
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          cookProvider.ingredientsExpanded.value =
              !cookProvider.ingredientsExpanded.value;
        },
        icon: ValueListenableBuilder(
          valueListenable: cookProvider.ingredientsExpanded,
          builder: (context, value, child) {
            if (value) return const Icon(Icons.expand_less);
            return const Icon(Icons.expand_more);
          },
        ),
      ),
    );
  }

  /// Ingredients Filter
  Widget _buildFilterIngredients(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cookProvider.ingredientsExpanded,
      builder: (context, value, child) {
        if (!value) return const SizedBox();
        return Card(
          elevation: 5,
          child: Wrap(
            children: cookProvider.ingredients.map((e) {
              return ChangeNotifierProvider.value(
                value: e,
                child: Consumer<IngredientFilter>(
                  builder: (context, value, child) {
                    return FilterChip(
                      selected: e.isFilterActive,
                      label: Text(e.name),
                      onSelected: (valueBool) {
                        cookProvider.updateIngredientsString(
                          valueBool,
                          value.name,
                        );
                        e.toggleFilterActive(valueBool);
                      },
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  /// Meal Type List Tile
  Widget _buildListTileMealType(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Meal Type'),
          ValueListenableBuilder(
            valueListenable: cookProvider.mealTypeString,
            builder: (context, value, child) {
              print(value);
              return Text(
                value,
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          cookProvider.mealTypeExpanded.value =
              !cookProvider.mealTypeExpanded.value;
        },
        icon: ValueListenableBuilder(
          valueListenable: cookProvider.mealTypeExpanded,
          builder: (context, value, child) {
            if (value) return const Icon(Icons.expand_less);
            return const Icon(Icons.expand_more);
          },
        ),
      ),
    );
  }

  /// Meal Type Filter
  Widget _buildFilterMealType(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cookProvider.mealTypeExpanded,
      builder: (context, value, child) {
        if (!value) return const SizedBox();
        return Card(
          elevation: 5,
          child: Wrap(
            children: cookProvider.mealTypes.map((e) {
              print(e);
              return ChoiceChip(
                label: Text(e),
                selected: cookProvider.mealTypeString.value == e,
                onSelected: (value) => cookProvider.mealTypeString.value = e,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  /// Diet Labels List Tile
  Widget _buildListTileDietLabels(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Diet Labels'),
          ValueListenableBuilder(
            valueListenable: cookProvider.dietLabelsString,
            builder: (context, value, child) {
              print(value);
              return Text(
                value,
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          cookProvider.dietLabelsExpanded.value =
              !cookProvider.dietLabelsExpanded.value;
        },
        icon: ValueListenableBuilder(
          valueListenable: cookProvider.dietLabelsExpanded,
          builder: (context, value, child) {
            if (value) return const Icon(Icons.expand_less);
            return const Icon(Icons.expand_more);
          },
        ),
      ),
    );
  }

  /// Diet Labels Filter
  Widget _buildFilterDietLabels(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cookProvider.dietLabelsExpanded,
      builder: (context, value, child) {
        if (!value) return const SizedBox();
        return Card(
          elevation: 5,
          child: Wrap(
            children: cookProvider.dietLabels.map((e) {
              print(e);
              return ChoiceChip(
                label: Text(e),
                selected: cookProvider.dietLabelsString.value == e,
                onSelected: (value) => cookProvider.dietLabelsString.value = e,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _errorSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMsg)),
    );
  }
}
