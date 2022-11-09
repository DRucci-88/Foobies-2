import 'package:foobies_app/data/models/edamam/ingredients.dart';
import 'package:foobies_app/data/models/edamam/nutrient.dart';

class Recipe {
  String? uri;
  String? label;
  String? image;
  String? imageThumbnail;
  String? imageRegular;
  String? source;
  String? url;
  double? serving;
  List<String>? healthLabels;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  Map<String, Nutrient>? nutrients;

  // List<dynamic>? protein;
  // List<dynamic>? fat;
  // List<dynamic>? carbs;
  // List<dynamic>? energy;
  // List<dynamic>? fiber;
  // List<dynamic>? sugars;
  // List<dynamic>? cholesterol;
  // List<dynamic>? sodium;
  // List<dynamic>? calcium;
  // List<dynamic>? magnesium;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.imageThumbnail,
    this.imageRegular,
    this.source,
    this.url,
    this.serving,
    this.healthLabels,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.nutrients,
    // this.protein,
    // this.fat,
    // this.carbs,
    // this.energy,
    // this.fiber,
    // this.sugars,
    // this.cholesterol,
    // this.sodium,
    // this.calcium,
    // this.magnesium,
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
      healthLabels:
          (json['healthLabels'] as List).map((e) => e as String).toList(),
      ingredients: (json['ingredients'] as List)
          .map((e) => Ingredients.fromJson(e))
          .toList(),
      calories: json['calories'],
      totalWeight: json['totalWeight'],
      cuisineType:
          (json['cuisineType'] as List).map((e) => e as String).toList(),
      mealType: (json['mealType'] as List).map((e) => e as String).toList(),
      dishType: (json['dishType'] as List).map((e) => e as String).toList(),
      nutrients: <String, Nutrient>{
        json['totalNutrients']['PROCNT']['label']:
            Nutrient.fromJson(json['totalNutrients']['PROCNT']),
        json['totalNutrients']['FAT']['label']:
            Nutrient.fromJson(json['totalNutrients']['FAT']),
        json['totalNutrients']['CHOCDF']['label']:
            Nutrient.fromJson(json['totalNutrients']['CHOCDF']),
        json['totalNutrients']['ENERC_KCAL']['label']:
            Nutrient.fromJson(json['totalNutrients']['ENERC_KCAL']),
        json['totalNutrients']['FIBTG']['label']:
            Nutrient.fromJson(json['totalNutrients']['FIBTG']),
        json['totalNutrients']['SUGAR']['label']:
            Nutrient.fromJson(json['totalNutrients']['SUGAR']),
        json['totalNutrients']['CHOLE']['label']:
            Nutrient.fromJson(json['totalNutrients']['CHOLE']),
        json['totalNutrients']['NA']['label']:
            Nutrient.fromJson(json['totalNutrients']['NA']),
        json['totalNutrients']['CA']['label']:
            Nutrient.fromJson(json['totalNutrients']['CA']),
        json['totalNutrients']['MG']['label']:
            Nutrient.fromJson(json['totalNutrients']['MG']),
      },
      // protein: <dynamic>[
      //   json['totalNutrients']['PROCNT']['label'] as String,
      //   json['totalNutrients']['PROCNT']['quantity'] as double,
      //   json['totalNutrients']['PROCNT']['unit'] as String,
      // ],
      // fat: <dynamic>[
      //   json['totalNutrients']['FAT']['label'] as String,
      //   json['totalNutrients']['FAT']['quantity'] as double,
      //   json['totalNutrients']['FAT']['unit'] as String,
      // ],
      // carbs: <dynamic>[
      //   json['totalNutrients']['CHOCDF']['label'] as String,
      //   json['totalNutrients']['CHOCDF']['quantity'] as double,
      //   json['totalNutrients']['CHOCDF']['unit'] as String,
      // ],
      // energy: <dynamic>[
      //   json['totalNutrients']['ENERC_KCAL']['label'] as String,
      //   json['totalNutrients']['ENERC_KCAL']['quantity'] as double,
      //   json['totalNutrients']['ENERC_KCAL']['unit'] as String,
      // ],
      // fiber: <dynamic>[
      //   json['totalNutrients']['FIBTG']['label'] as String,
      //   json['totalNutrients']['FIBTG']['quantity'] as double,
      //   json['totalNutrients']['FIBTG']['unit'] as String,
      // ],
      // sugars: <dynamic>[
      //   json['totalNutrients']['SUGAR']['label'] as String,
      //   json['totalNutrients']['SUGAR']['quantity'] as double,
      //   json['totalNutrients']['SUGAR']['unit'] as String,
      // ],
      // cholesterol: <dynamic>[
      //   json['totalNutrients']['CHOLE']['label'] as String,
      //   json['totalNutrients']['CHOLE']['quantity'] as double,
      //   json['totalNutrients']['CHOLE']['unit'] as String,
      // ],
      // sodium: <dynamic>[
      //   json['totalNutrients']['NA']['label'] as String,
      //   json['totalNutrients']['NA']['quantity'] as double,
      //   json['totalNutrients']['NA']['unit'] as String,
      // ],
      // calcium: <dynamic>[
      //   json['totalNutrients']['CA']['label'] as String,
      //   json['totalNutrients']['CA']['quantity'] as double,
      //   json['totalNutrients']['CA']['unit'] as String,
      // ],
      // magnesium: <dynamic>[
      //   json['totalNutrients']['MG']['label'] as String,
      //   json['totalNutrients']['MG']['quantity'] as double,
      //   json['totalNutrients']['MG']['unit'] as String,
      // ],
    );
  }
}
