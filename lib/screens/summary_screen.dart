// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kishoop/screens/home_screen.dart';
import 'package:kishoop/widgets/button.dart';

class SummaryScreen extends StatefulWidget {
  final String typeOfTshirt, imageForTshirt, pickUpDate;
  final double totalCost;

  const SummaryScreen({
    Key? key,
    this.totalCost = 0.0,
    this.imageForTshirt = '',
    this.typeOfTshirt = '',
    this.pickUpDate = '',
  }) : super(key: key);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: const Text(
          "Order summary",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "TYPE OF T-SHIRT: ${widget.typeOfTshirt}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Text(
              "IMAGE FOR T-SHIRT: ${widget.imageForTshirt}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Text(
              "PICK-UP DATE: ${widget.pickUpDate}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Text(
              "Total cost: \$${widget.totalCost.toStringAsFixed(2)}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  buttonText: "Cancel",
                  buttonColor: Colors.red[400]!,
                  buttonSizeHeight: 40,
                  buttonSizeWidth: 140,
                ),
                Button(
                  buttonText: "Send order",
                  buttonColor: Colors.teal[400]!,
                  buttonSizeHeight: 40,
                  buttonSizeWidth: 140,
                  onTap: const HomeScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
