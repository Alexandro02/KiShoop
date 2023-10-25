// ignore_for_file: library_private_types_in_public_api

import 'package:kishoop/screens/summary_screen.dart';
import 'package:kishoop/widgets/button.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatefulWidget {
  final String imageForTshirt, typeOfTshirt;
  final double totalCost;

  const PickupScreen({
    Key? key,
    required this.totalCost,
    required this.imageForTshirt,
    required this.typeOfTshirt,
  }) : super(key: key);

  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final List<String> itemsOptions = [
    'Fri Nov 1',
    'Thu Jan 27',
    'Sun Apr 12',
    'Mon Jul 8'
  ];
  String deliveryDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: const Text("Choose your delivery date"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            itemCount: itemsOptions.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(
                  itemsOptions[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                value: itemsOptions[index],
                groupValue: deliveryDate,
                onChanged: (value) {
                  setState(() {
                    deliveryDate = value!;
                  });
                },
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 3,
              color: Color.fromARGB(81, 158, 158, 158),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Subtotal: \$${widget.totalCost.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                buttonText: "Continue",
                buttonColor: Colors.teal[400]!,
                onTap: SummaryScreen(
                  imageForTshirt: widget.imageForTshirt,
                  typeOfTshirt: widget.typeOfTshirt,
                  totalCost: widget.totalCost,
                  pickUpDate: deliveryDate,
                ),
                buttonSizeHeight: 40,
                buttonSizeWidth: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
