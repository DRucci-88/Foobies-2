import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foobies_app/data/models/edamam/recipe.dart';

/// Appbar: Title
/// Image URL Reguler
/// dishType, mealType, cuisineType,
/// serving, calories, totalWeight, totalTime (mins)
/// All Ingredients: text, image, weight in (g)
///

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
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
                    maxHeight: 100,
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
                          recipe.dishType!
                              .fold('', (prev, element) => prev += element),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          recipe.mealType!
                              .fold('', (prev, element) => prev += element),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          recipe.cuisineType!
                              .fold('', (prev, element) => prev += element),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          recipe.dietLabels!
                              .fold('', (prev, element) => prev += element),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
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
                    const Icon(Icons.person),
                    Text('${recipe.serving} servings'),
                  ]),
                ),
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    const Icon(Icons.timelapse),
                    Text('${recipe.totalTime} mins'),
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
                    const Icon(Icons.monitor_weight),
                    Text('${recipe.totalWeight!.toStringAsFixed(2)} g'),
                  ]),
                ),
                SizedBox.fromSize(
                  size: const Size(80, 56),
                  child: Column(children: [
                    const Icon(Icons.fastfood),
                    Text(
                      '${recipe.calories!.toStringAsFixed(2)} calories',
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
            for (int i = 0; i < recipe.ingredients!.length; i++)
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
                subtitle: Text(
                    '${recipe.ingredients![i].weight!.toStringAsFixed(2)} grams'),
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
