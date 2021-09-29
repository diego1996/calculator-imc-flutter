import 'package:calculator_imc/pages/home.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorIMCApp());
}

class CalculatorIMCApp extends StatelessWidget {
  const CalculatorIMCApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
