import 'package:foobies_app/data/models/edamam/ingredients.dart';

class Recipe {
  String? uri;
  String? label;
  String? image;
  String? imageThumbnail;
  String? imageRegular;
  String? source;
  String? url;
  double? serving;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.imageThumbnail,
    this.imageRegular,
    this.source,
    this.url,
    this.serving,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.cuisineType,
    this.mealType,
    this.dishType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      uri: json['uri'],
      label: json['label'],
      image: json['image'],
      imageThumbnail: json['images']['THUMBNAIL']['url'],
      imageRegular: json['images']['REGULAR']['url'],
      source: json['source'],
      url: json['url'],
      serving: json['yield'],
      ingredients: (json['ingredients'] as List)
          .map((e) => Ingredients.fromJson(e))
          .toList(),
      calories: json['calories'],
      totalWeight: json['totalWeight'],
      cuisineType:
          (json['cuisineType'] as List).map((e) => e as String).toList(),
      mealType: (json['mealType'] as List).map((e) => e as String).toList(),
      dishType: (json['dishType'] as List).map((e) => e as String).toList(),
    );
  }
}
