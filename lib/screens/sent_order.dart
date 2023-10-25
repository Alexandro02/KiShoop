import 'package:flutter/material.dart';
import 'package:kishoop/screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class SentOrder extends StatelessWidget {
  const SentOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/OrderSent.json',
            ),
          ),
          const Text(
            "Order sent!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            style: ButtonStyle(
                maximumSize: MaterialStateProperty.all<Size>(
              const Size(140, 45),
            )),
            child: const Text("Continue"),
          )
        ],
      ),
    );
  }
}
