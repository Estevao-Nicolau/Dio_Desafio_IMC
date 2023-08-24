class Person {
  String? name;
  double weight;
  double height;

  Person({
    required this.name,
    required this.weight,
    required this.height,
  });
  double calcularIMC() {
    if (height <= 0) {
      return 0.0;
    }
    double imc = weight / (height * height);
    return double.parse(imc.toStringAsFixed(2));
  }
}
