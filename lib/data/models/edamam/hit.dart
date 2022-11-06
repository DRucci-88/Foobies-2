import 'package:foobies_app/data/models/edamam/recipe.dart';

class Hit {
  Recipe? recipe;
  String? selfHref;

  Hit({this.recipe, this.selfHref});

  factory Hit.fromJson(Map<String, dynamic> json) {
    return Hit(
      recipe: Recipe.fromJson(json['recipe']),
      selfHref: json['_links']['self']['href'],
    );
  }
}
