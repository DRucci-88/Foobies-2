class Ingredients {
  String? text;
  double? weight;
  String? foodCategory;
  String? image;

  Ingredients({
    this.text,
    this.weight,
    this.foodCategory,
    this.image,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      text: json['text'],
      weight: json['weight'],
      foodCategory: json['foodCategory'],
      image: json['image'],
    );
  }
}
