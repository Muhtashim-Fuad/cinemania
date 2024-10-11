import 'package:flutter/material.dart';
import 'package:cinemania/screens/home_screen.dart';
import 'package:cinemania/style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: StyleData.darkTheme,
      home: const HomeScreen(),
    );
  }
}
