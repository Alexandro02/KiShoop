// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:kishoop/screens/home_screen.dart';

// Just testing API.
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MainApp(),
  );
}

void fetchData() async {
  final url = Uri.parse('https://car-data.p.rapidapi.com/cars/types');
  final headers = {
    'X-RapidAPI-Key': 'caac8a6f9emsha9440d5ea5fcd0fp1959f7jsnabddd3594478',
    'X-RapidAPI-Host': 'car-data.p.rapidapi.com'
  };

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Datos recibidos: $data');
    } else {
      // Maneja errores si la solicitud no fue exitosa
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
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
            "T-shirt customization",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[600],
        ),
        body: const Column(
          children: [
            HomeScreen(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: Text("Try API!"),
            ),
          ],
        ),
      ),
    );
  }
}
