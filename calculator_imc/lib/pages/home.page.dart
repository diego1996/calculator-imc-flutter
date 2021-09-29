import 'package:calculator_imc/pages/result.page.dart';
import 'package:calculator_imc/widgets/button.sex.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 1;
  int _currentAgeValue = 10;
  int _currentWeightValue = 10;
  bool active = true;
  double imc = 0.0;

  @override
  void initState() {
    super.initState();
  }

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
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonSex(
                title: "Hombre",
                icon: "assets/man-white.png",
                color: !active ? Colors.white10 : Colors.black12,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
              ButtonSex(
                title: "Mujer",
                icon: "assets/girl-white.png",
                color: active ? Colors.white10 : Colors.black12,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
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
                        const Text("Estatura",
                            style: TextStyle(color: Colors.white70)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_currentSliderValue.toInt()}",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("cm",
                                style: TextStyle(color: Colors.white70),
                                textAlign: TextAlign.end),
                          ],
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 250,
                          divisions: 250,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          thumbColor: Colors.red,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getCard(
                  title: "Peso",
                  currentValue: _currentWeightValue,
                  methodRemove: () {
                    setState(() {
                      _currentWeightValue--;
                    });
                  },
                  methodAdd: () {
                    setState(() {
                      _currentWeightValue++;
                    });
                  }),
              _getCard(
                  title: "Edad",
                  currentValue: _currentAgeValue,
                  methodRemove: () {
                    setState(() {
                      _currentAgeValue--;
                    });
                  },
                  methodAdd: () {
                    setState(() {
                      _currentAgeValue++;
                    });
                  }),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Calcular",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    imc = (_currentWeightValue /
                        (_currentSliderValue /
                            100 *
                            _currentSliderValue /
                            100));
                    imc = ((imc * 1000).ceil() / 1000);
                    print(imc);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(imc: imc)));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _getCard(
      {required String title,
      int currentValue = 0,
      dynamic methodRemove,
      dynamic methodAdd}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(color: Colors.white70)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentValue.toInt()}",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          onPressed: methodRemove,
                          child: const Icon(Icons.remove),
                          shape: const CircleBorder(side: BorderSide.none),
                          color: Colors.white60),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: MaterialButton(
                          onPressed: methodAdd,
                          child: const Icon(Icons.add),
                          shape: const CircleBorder(side: BorderSide.none),
                          color: Colors.white60),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
