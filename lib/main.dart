import 'package:flutter/material.dart';
import 'package:offline_app/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffebecf1)),
      home: const HomeScreen(),
    );
  }
}

class Scroll extends StatelessWidget {
  const Scroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Container(
                  height: 200,
                )),
      ),
    );
  }
}
