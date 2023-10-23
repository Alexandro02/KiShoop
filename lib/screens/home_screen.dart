// ignore_for_file: library_private_types_in_public_api

import 'package:kishoop/screens/custom_screen.dart';
import 'package:kishoop/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Image(
            image: NetworkImage(
                "https://static.vecteezy.com/system/resources/previews/008/847/318/non_2x/isolated-black-t-shirt-front-free-png.png"),
          ),
          const SizedBox(height: 35),
          const Text(
            "Buy our T-shirts",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          Button(
            buttonText: "Without image",
            pageToNav: CustomScreen(
              totalCost: 29.99,
              typeOfTshirt: 'Without image',
            ),
            buttonColor: Colors.teal,
            buttonSizeHeight: 45.0,
            buttonSizeWidth: 140.0,
          ),
          const SizedBox(height: 25),
          Button(
            buttonText: "With image",
            pageToNav: CustomScreen(
              totalCost: 39.99,
              typeOfTshirt: 'With image',
            ),
            buttonColor: Colors.teal,
            buttonSizeHeight: 45.0,
            buttonSizeWidth: 140.0,
          ),
          const SizedBox(height: 25),
          Button(
            buttonText: "Custom image",
            pageToNav: CustomScreen(
              totalCost: 79.99,
              typeOfTshirt: 'Custom image',
            ),
            buttonColor: Colors.teal,
            buttonSizeHeight: 45.0,
            buttonSizeWidth: 140.0,
          )
        ],
      ),
    );
  }
}
