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
        backgroundColor: Colors.orange,
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
              future:
                  Provider.of<HomeProvider>(context, listen: false).homeInitial(
                ingredient: 'Chicken',
                onError: (errorMsg) => _errorSnackBar(context, errorMsg),
              ),
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
                    // value.homeEdamam!.hits![0].recipe!.nutrients!.forEach(
                    //   (key, value) => print(key),
                    // );
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

  void _errorSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMsg)),
    );
  }
}
