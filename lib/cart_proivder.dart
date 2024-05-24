import 'package:flutter/material.dart';
import 'package:cart/datamodel.dart';

class CartProvider with ChangeNotifier {
  List<ItemDataModel> _cartItems = [];

  List<ItemDataModel> get cartItems => _cartItems;

  void addToCart(ItemDataModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(ItemDataModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }
}
