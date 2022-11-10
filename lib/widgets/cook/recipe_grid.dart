import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foobies_app/pages/recipe_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:foobies_app/providers/cook_provider.dart';

class RecipeGrid extends StatelessWidget {
  const RecipeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cookProvider = Provider.of<CookProvider>(context);
    final hits = cookProvider.cookEdamam?.hits ?? [];

    return GridView.builder(
      itemCount: hits.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // return Container(color: Colors.amber);
        return GridTile(
          header: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              hits[index].recipe!.label!,
              style: const TextStyle(fontSize: 12),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return RecipeDetailPage(recipe: hits[index].recipe!);
                    },
                  ),
                );
              },
              icon: const Icon(Icons.info),
            ),
          ),
          child: Image(
            image: CachedNetworkImageProvider(hits[index].recipe!.image!),
          ),
        );
      },
    );
  }
}
