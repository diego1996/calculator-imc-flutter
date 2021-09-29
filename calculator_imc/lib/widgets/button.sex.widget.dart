import 'package:flutter/material.dart';

class ButtonSex extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final dynamic method;

  const ButtonSex(
      {Key? key, required this.title, required this.icon, required this.color, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          color: color,
          onPressed: method,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 50,
                fit: BoxFit.cover,
              ),
              Text("\n$title", style: const TextStyle(color: Colors.white70))
            ],
          ),
        ),
      ),
    );
  }
}
