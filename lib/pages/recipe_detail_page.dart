import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foobies_app/data/models/edamam/recipe.dart';
import 'package:foobies_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

/// Appbar: Title
/// Image URL Reguler
/// dishType, mealType, cuisineType,
/// serving, calories, totalWeight, totalTime (mins)
/// All Ingredients: text, image, weight in (g)
///

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final Recipe recipe = homeProvider.findRecipeById(index);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image with Label: Dish type, Meal type, Cuisine Type
            Center(
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      recipe.image!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                    maxHeight: 80,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.dishType![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          recipe.mealType![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          recipe.cuisineType![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            /// Calculation unit: serving, total time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    Icon(Icons.person),
                    Text('4 servings'),
                  ]),
                ),
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    Icon(Icons.timelapse),
                    Text('4 servings'),
                  ]),
                )
              ],
            ),

            /// Calculation unit: total weight, total calories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    Icon(Icons.monitor_weight),
                    Text('1825 g'),
                  ]),
                ),
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    Icon(Icons.fastfood),
                    Text(
                      '3003 calories',
                      textAlign: TextAlign.center,
                    ),
                  ]),
                )
              ],
            ),

            /// List of Ingredients
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Text(
                'Ingredients (${recipe.ingredients!.length.toString()})',
              ),
            ),
            for (int i = 0; i < 10; i++)
              ListTile(
                leading: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        recipe.ingredients![i].image!,
                      ),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                title: Text(recipe.ingredients![i].text!),
                subtitle: Text('${recipe.ingredients![i].weight} grams'),
              )
            // ListView.separated(
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text('drums stick'),
            //     );
            //   },
            //   separatorBuilder: (context, index) => const Divider(),
            //   itemCount: 10,
            // )
          ],
        ),
      ),
    );
  }
}
