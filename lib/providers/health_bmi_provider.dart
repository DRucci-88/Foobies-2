import 'package:flutter/material.dart';

class HealthBMIProvider with ChangeNotifier {
  final heightCtl = TextEditingController();
  final weightCtl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  double resultBMI = 0;
  String categoryBMI = '';
  Color categoryColor = const Color.fromARGB(255, 245, 245, 245);

  void calculate() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    double height = double.parse(heightCtl.text) / 1000;
    double weight = double.parse(weightCtl.text) / 100;
    print(height);
    print(weight);

    resultBMI = weight / (height * height);
    print(resultBMI);
    if (resultBMI < 18.5) {
      categoryBMI = 'Underweight';
      categoryColor = const Color.fromRGBO(255, 235, 59, 1);
    } else if (resultBMI >= 18.5 && resultBMI < 24.99) {
      categoryBMI = 'Normal';
      categoryColor = const Color.fromRGBO(76, 175, 80, 1);
    } else if (resultBMI >= 25 && resultBMI <= 29.99) {
      categoryBMI = 'Overweight';
      categoryColor = const Color.fromRGBO(255, 235, 59, 1);
    } else if (resultBMI >= 30) {
      categoryBMI = 'Obese';
      categoryColor = const Color.fromRGBO(244, 67, 54, 1);
    }
    notifyListeners();
  }

  void reset() {
    heightCtl.text = '';
    weightCtl.text = '';
    resultBMI = 0;
    notifyListeners();
  }
}
