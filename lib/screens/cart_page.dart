// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kishoop/models/Car.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems =
        Provider.of<CarProvider>(context, listen: false).cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
        backgroundColor: Colors.orange[400],
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Shopping Cart empty!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          // Build added cars to shopping cart.
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final car = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.teal[400]!,
                      ),
                      color: Colors.teal,
                    ),
                    child: ListTile(
                      title: Text(
                        car.make,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Model: ${car.model}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          // Remove item from cart.
                          Provider.of<CarProvider>(context, listen: false)
                              .removeFromCart(car);
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                // onPressed: () {},
                onPressed: () {
                  Provider.of<CarProvider>(context, listen: false).clearCart();
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.orange.shade400,
                  ),
                ),
                child: const Text("Clear Cart"),
              ),
            )
          : null,
    );
  }
}
