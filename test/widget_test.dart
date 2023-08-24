// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bmi_calculator/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste de HomePage Widget', (WidgetTester tester) async {
    // Constrói nosso widget em uma árvore de widgets de teste
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Encontra os widgets de TextField
    final nomeTextField = find.widgetWithText(TextField, 'Nome:');
    final pesoTextField = find.widgetWithText(TextField, 'Peso (kg)');
    final alturaTextField = find.widgetWithText(TextField, 'Altura (0.00)');

    // Verifica se os widgets de TextField foram construídos
    expect(nomeTextField, findsOneWidget);
    expect(pesoTextField, findsOneWidget);
    expect(alturaTextField, findsOneWidget);

    // Insere texto nos widgets de TextField
    await tester.enterText(nomeTextField, 'John Doe');
    await tester.enterText(pesoTextField, '70.0');
    await tester.enterText(alturaTextField, '1.75');

    // Encontra o botão "Calcular IMC" e o pressiona
    final calcularButton = find.widgetWithText(ElevatedButton, 'Calcular IMC');
    expect(calcularButton, findsOneWidget);
    await tester.tap(calcularButton);
    await tester.pump();

    // Encontra o widget de texto resultante e verifica o conteúdo
    final resultText =
        find.text('John Doe\nIMC é: 22.86\nClassificação: Saudável');
    expect(resultText, findsOneWidget);
  });
}
