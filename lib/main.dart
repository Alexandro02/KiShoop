// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:kishoop/screens/home_screen.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Prestige Innovations",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[400]!,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
