import 'package:flutter/material.dart';
import 'package:foobies_app/di/service_locator.dart';
import 'package:foobies_app/pages/index_navigation.dart';
import 'package:foobies_app/pages/recipe_detail_page.dart';
import 'package:foobies_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const IndexNavigation(),
        // home: const RecipeDetailPage(index: 1),
      ),
    );
  }
}

/// https://dhruvnakum.xyz/networking-in-flutter-dio
/// https://javiercbk.github.io/json_to_dart/
/// https://pub.dev/packages/get_it
/// https://pub.dev/packages/dio
/// 