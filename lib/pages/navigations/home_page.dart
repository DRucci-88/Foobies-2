import 'package:flutter/material.dart';
import 'package:foobies_app/widgets/home/recipe_carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('Initial Home');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
        child: Column(
          children: [
            const Center(
              child: Text('Foods', style: TextStyle(fontSize: 28)),
            ),
            const SizedBox(height: 8.0),
            FutureBuilder(
              future: Provider.of<HomeProvider>(context, listen: false)
                  .homeInitial(ingredient: 'Chicken'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.error != null) {
                  return const Center(child: Text('An Error Occured'));
                }
                return Consumer<HomeProvider>(
                  builder: (context, value, child) {
                    if (value.homeEdamam == null ||
                        value.homeEdamam!.count! <= 0) {
                      return const Center(
                        child: Text('Zero Result'),
                      );
                    }
                    value.homeEdamam!.hits![0].recipe!.nutrients!.forEach(
                      (key, value) => print(key),
                    );
                    print('Recipe Carousel Slider');
                    return const Expanded(
                      child: RecipeCarouselSlider(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildCarouselSlider(BuildContext context, List<Hit> hits) {
  //   return CarouselSlider.builder(
  //     itemCount: hits.length,
  //     itemBuilder: (context, index, realIndex) {
  //       print(index);
  //       print(realIndex);
  //       return SizedBox(
  //         height: 500,
  //         child: RecipeCardItem(hit: hits[index]),
  //         // child: Text(index.toString()),
  //       );
  //     },
  //     options: CarouselOptions(
  //       viewportFraction: 0.7,
  //       autoPlayCurve: Curves.easeInOutCubic,
  //       autoPlayInterval: const Duration(seconds: 4),
  //       autoPlayAnimationDuration: const Duration(seconds: 2),
  //       enlargeCenterPage: true,
  //       scrollDirection: Axis.vertical,
  //       // autoPlay: true,
  //       onPageChanged: (index, reason) {
  //         print(index);
  //       },
  //     ),
  //   );
  // }
}
