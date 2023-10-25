// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kishoop/screens/home_screen.dart';

class Button extends StatelessWidget {
  final String buttonText;
  Widget onTap;
  final Color buttonColor;
  final double buttonSizeHeight;
  final double buttonSizeWidth;

  Button({
    super.key,
    required this.buttonText,
    this.onTap = const HomeScreen(),
    required this.buttonColor,
    required this.buttonSizeHeight,
    required this.buttonSizeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Navigation
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => onTap,
        ),
      ),
      // Button Styles
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(buttonSizeWidth, buttonSizeHeight),
        ),
      ),
      // Text Button
      child: Text(buttonText),
    );
  }
}
