// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:kishoop/models/Car.dart';
import 'package:flutter/material.dart';

// For API connections.
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kishoop/widgets/CarListItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    // Call getTypes only if the List of cars is empty.
    getTypes();
  }

  Future<void> getTypes() async {
    final url = Uri.parse('https://car-data.p.rapidapi.com/cars/');
    final headers = {
      'X-RapidAPI-Key': 'caac8a6f9emsha9440d5ea5fcd0fp1959f7jsnabddd3594478',
      'X-RapidAPI-Host': 'car-data.p.rapidapi.com'
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (kDebugMode) {
          cars = List<Car>.from(
            jsonData.map(
              (car) => Car(
                id: car['id'],
                make: car['make'],
                model: car['model'],
                year: car['year'],
                type: car['type'],
              ),
            ),
          );
        }
      } else {
        // Handle errors if the request is not successful
        if (kDebugMode) {
          print('Error in the request: ${response.statusCode}');
        }
      }
      setState(() {}); // Update the UI after data is fetched
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Prestige Innovations",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400]!,
      ),
      body: cars.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.teal,
              ),
            )
          : ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return CarListItem(
                  car: car,
                );
              },
            ),
    );
  }
}
