import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyBotton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.yellow,
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
