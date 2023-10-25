import 'package:flutter/material.dart';
import 'package:kishoop/models/Car.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  const CarListItem({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.teal,
      ),
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Make: ${car.make}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
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
          ElevatedButton(
            onPressed: () {
              // Handle button click here
            },
            child: const Text("Buy!"),
          ),
        ],
      ),
    );
  }
}
