import 'package:flutter/material.dart';

import '../model/person_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Person person = Person(
      name: '', weight: 0.0, height: 0.0); // Crie uma instância de Person

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Nome:'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Altura (0.00)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  double weight = double.tryParse(weightController.text) ?? 0.0;
                  double height = double.tryParse(heightController.text) ?? 0.0;
        
                  person.name = name;
                  person.weight = weight;
                  person.height = height;
        
                  double imc = person.calcularIMC();
        
                  String classification;
                  if (imc < 16) {
                    classification = "Magreza grave";
                  } else if (imc < 17) {
                    classification = "Magreza moderada";
                  } else if (imc < 18.5) {
                    classification = "Magreza leve";
                  } else if (imc < 25) {
                    classification = "Saudável";
                  } else if (imc < 30) {
                    classification = "Sobrepeso";
                  } else if (imc < 35) {
                    classification = "Obesidade Grau 1";
                  } else if (imc < 40) {
                    classification = "Obesidade Grau 2";
                  } else {
                    classification = "Obesidade Grau 3";
                  }
        
                  setState(() {
                    result = '$name\nIMC é: $imc\nClassificação: $classification';
                  });
                },
                child: const Text('Calcular IMC'),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
