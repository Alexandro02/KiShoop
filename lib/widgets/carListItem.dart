// ignore_for_file: file_names, avoid_print

import 'package:kishoop/models/Car.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  const CarListItem({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[300],
      ),
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 5.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Make: ${car.make}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Model: ${car.model}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Year: ${car.year.toString()}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Type: ${car.type}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Add cart to
          ElevatedButton(
            onPressed: () {
              final carProvider =
                  Provider.of<CarProvider>(context, listen: false);
              carProvider.addToCart(car);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.amber,
              ),
            ),
            child: const Text("Add to cart"),
          ),
        ],
      ),
    );
  }
}
