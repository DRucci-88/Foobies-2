import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:foobies_app/providers/home_provider.dart';
import 'package:foobies_app/widgets/home/recipe_card_item.dart';

/// FOODS ['Chicken','Egg','Fish','Meat','Pasta','Rice']
/// DRINKS ['Boba','Cocktail','Coffee','Juice','Milk','Milkshake'];
/// DESSERTS ['Brownies', 'Cake', 'Pancake', 'Pudding'];

/// totalNutrients 1: Protein, FAT, CARBS, Energy
/// totalNutrients 2: Fiber, Sugars, Cholesterol, Sodium, Calcium, Magnesium
/// healthLabels ALL
/// Using Regular Image
/// yield / serving
/// label for title
/// dietLabels hint aja dari title
/// Go to another Web View: url

class RecipeCarouselSlider extends StatelessWidget {
  const RecipeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final hits = homeProvider.homeEdamam?.hits ?? [];
    return CarouselSlider.builder(
      itemCount: hits.length,
      itemBuilder: (context, index, realIndex) {
        print(index);
        print(realIndex);
        return SizedBox(
          height: 500,
          child: RecipeCardItem(
            key: ValueKey(hits[index].recipe!.label!),
            index: index,
            image: hits[index].recipe!.image!,
            label: hits[index].recipe!.label!,
            healthLabelsOneString: HomeProvider.parseHealthLabels(
                hits[index].recipe!.healthLabels!),
            serving: hits[index].recipe!.serving!,
            nutrients: hits[index].recipe!.nutrients!,
          ),
          // child: Text(index.toString()),
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.7,
        autoPlayCurve: Curves.easeInOutCubic,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
        scrollDirection: Axis.vertical,
        // autoPlay: true,
        onPageChanged: (index, reason) {
          print(index);
        },
      ),
    );
  }
}
