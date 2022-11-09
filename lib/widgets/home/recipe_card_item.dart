import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foobies_app/data/models/edamam/nutrient.dart';
import 'package:foobies_app/pages/recipe_detail_page.dart';
// import '';

class RecipeCardItem extends StatelessWidget {
  const RecipeCardItem({
    super.key,
    required this.index,
    required this.image,
    required this.label,
    required this.healthLabelsOneString,
    required this.serving,
    required this.nutrients,
  });
  final int index;
  final String image;
  final String label;
  final String healthLabelsOneString;
  final double serving;
  final Map<String, Nutrient> nutrients;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: _buildBodyCard()),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetailPage(index: index);
                    },
                  ),
                );
              },
              child: const Text('Go to detail'),
            ),
            _buildBottomCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyCard() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 200,
        minWidth: double.infinity,
        maxHeight: 300,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: CachedNetworkImage(
              imageUrl: image,
              // progressIndicatorBuilder: (context, url, progress) {
              //   return CircularProgressIndicator(value: progress.progress);
              // },
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (_, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(
            //   // 'https://picsum.photos/300',
            //   // 'https://example.does.not.exist/image.jpg',
            //   image,
            //   fit: BoxFit.cover,
            //   errorBuilder: (context, error, stackTrace) {
            //     return Container(
            //       color: Colors.amber,
            //       alignment: Alignment.center,
            //       child: const Text(
            //         'Whooppss',
            //         style: TextStyle(fontSize: 30),
            //       ),
            //     );
            //   },
            // ),
          ),
          const SizedBox(width: 14),

          /// Title and Health Labels
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    healthLabelsOneString,
                    style: const TextStyle(),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCard(BuildContext context) {
    double macroFontSize = 12.0;
    double microFontSize = 10.0;
    // var c = Colors.white;

    /// Macro Nutrients
    final macro = [
      {'color': Colors.green, 'nutrientType': NutrientEnum.protein},
      {'color': Colors.amber, 'nutrientType': NutrientEnum.fat},
      {'color': Colors.red, 'nutrientType': NutrientEnum.carbs},
    ];

    /// Micro Nutrients
    final micro = [
      NutrientEnum.fiber,
      NutrientEnum.sugars,
      NutrientEnum.cholesterol,
      NutrientEnum.sodium,
      NutrientEnum.calcium,
      NutrientEnum.magnesium,
    ];
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.amber,
            offset: Offset(0.0, 3.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: [
          /// Serving and Calories
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${serving.round()} servings'),
                RichText(
                  maxLines: 2,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: nutrients[NutrientEnum.energy]!
                            .quantity!
                            .round()
                            .toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      TextSpan(
                        text: nutrients[NutrientEnum.energy]!.unit,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                // Text(
                //     '${nutrients[NutrientEnum.energy]!.quantity!.round()} ${nutrients[NutrientEnum.energy]!.unit}'),
              ],
            ),
          ),
          const SizedBox(width: 14),

          /// Macro Nutrients
          Expanded(
            flex: 3,
            child: ListView.separated(
              itemCount: macro.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: macro[i]['color'] as Color,
                      maxRadius: 3,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      macro[i]['nutrientType'] as String,
                      style: TextStyle(fontSize: macroFontSize),
                    ),
                    const Spacer(),
                    Text(
                      '${nutrients[macro[i]['nutrientType']]!.quantity!.toStringAsFixed(2)} ${nutrients[macro[i]['nutrientType']]!.unit!}',
                      style: TextStyle(fontSize: macroFontSize),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            ),
          ),

          /// Micro Nutrients
          const SizedBox(width: 14),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: micro.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(
                      micro[i],
                      style: TextStyle(fontSize: microFontSize),
                    ),
                    const Spacer(),
                    Text(
                      '${nutrients[micro[i]]!.quantity!.toStringAsFixed(2)} ${nutrients[micro[i]]!.unit!}',
                      style: TextStyle(fontSize: microFontSize),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
