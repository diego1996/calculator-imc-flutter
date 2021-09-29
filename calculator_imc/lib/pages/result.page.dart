import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double imc;

  const ResultPage({Key? key, required this.imc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      body: _body(),
    );
  }

  _body() {
    List results = getResult();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Resultado",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.white10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(results[0].toUpperCase(),
                                  style: TextStyle(
                                      color: results[1],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(imc.toString(),
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(results[2],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 15)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  List getResult() {
    if (imc < 18.5) {
      return [
        "Bajo Peso",
        Colors.orangeAccent,
        "Tienes un bajo peso corporal. ¡Debes aumentar un poco de peso!"
      ];
    } else if (imc >= 18.5 && imc <= 24.9) {
      return [
        "Normal",
        Colors.greenAccent,
        "Tienes un peso corporal normal. ¡Buen trabajo!"
      ];
    } else if (imc >= 25 && imc <= 29.9) {
      return [
        "Sobrepeso",
        Colors.deepOrange,
        "Tienes un peso corporal en sobrepeso. ¡Debes bajar un poco de peso!"
      ];
    } else if (imc >= 30 && imc <= 34.9) {
      return [
        "Obesidad I",
        Colors.redAccent,
        "Tienes un peso corporal en obesidad nivel 1. ¡Debes bajar de peso!"
      ];
    } else if (imc >= 35 && imc <= 39.9) {
      return [
        "Obesidad II",
        Colors.redAccent,
        "Tienes un peso corporal en obesidad nivel 2. ¡Debes bajar de peso!"
      ];
    } else if (imc >= 40 && imc <= 49.9) {
      return [
        "Obesidad III",
        Colors.red,
        "Tienes un peso corporal en obesidad nivel 3. ¡Debes bajar de peso ahora!"
      ];
    } else {
      return [
        "Obesidad IV",
        Colors.red,
        "Tienes un peso corporal en obesidad nivel 4. ¡Debes bajar de peso urgente!"
      ];
    }
  }
}
