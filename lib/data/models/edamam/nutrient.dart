class Nutrient {
  String? label;
  double? quantity;
  String? unit;

  Nutrient({this.label, this.quantity, this.unit});

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      label: json['label'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}

class NutrientEnum {
  static String protein = 'Protein';
  static String fat = 'Fat';
  static String carbs = 'Carbs';
  static String energy = 'Energy';
  static String fiber = 'Fiber';
  static String sugars = 'Sugars';
  static String cholesterol = 'Cholesterol';
  static String sodium = 'Sodium';
  static String calcium = 'Calcium';
  static String magnesium = 'Magnesium';
}
