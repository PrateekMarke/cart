import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cart/cart_proivder.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(cartProvider.cartItems[index].name),
                        subtitle: Text('Rs. ${cartProvider.cartItems[index].price.toStringAsFixed(2)}'),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(cartProvider.cartItems[index].image),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            cartProvider.removeFromCart(cartProvider.cartItems[index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Price: Rs. ${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
