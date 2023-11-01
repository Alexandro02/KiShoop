// ignore_for_file: file_names, unused_field, avoid_print

import 'package:flutter/foundation.dart';

class Car {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  Car({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });
}

class CarProvider extends ChangeNotifier {
  int _id = 0;
  int _year = 0;
  String _make = "";
  String _model = "";
  String _type = "";

  List<Car> cars = [];
  List<Car> cartItems = [];

  // Add a car to the cart
  addToCart(Car car) {
    cartItems.add(car);
    notifyListeners();
  }

  // Remove a car from the cart
  removeFromCart(Car car) {
    cartItems.remove(car);
    notifyListeners();
  }

  // Clear the cart
  clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  setCarData(int id, int year, String make, String model, String type) {
    _id = id;
    _year = year;
    _make = make;
    _model = model;
    _type = type;
    notifyListeners();
  }
}
