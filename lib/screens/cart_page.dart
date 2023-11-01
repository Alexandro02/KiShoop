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
        title: const Text("Cart"),
        backgroundColor: Colors.orange[400],
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text("Shopping Cart empty!"),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final car = cartItems[index];
                return ListTile(
                  title: Text(car.make),
                  subtitle: Text("Model: ${car.model}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      // Remove item from cart.
                      Provider.of<CarProvider>(context, listen: false)
                          .removeFromCart(car);
                      setState(() {});
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? ElevatedButton(
              // onPressed: () {},
              onPressed: () {
                Provider.of<CarProvider>(context, listen: false).clearCart();
              },
              child: const Text("Clear Cart"),
            )
          : null,
    );
  }
}
