import 'package:flutter/material.dart';
import 'package:mmaaz_283826_lab12_task1/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StreamHomePage(),
    );
  }
}
