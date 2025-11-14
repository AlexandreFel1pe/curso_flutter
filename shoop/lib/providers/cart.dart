import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get item {
    return {..._items};
  }

  void addItem(Product produc) {
    if(_items.containsKey(produc.id)) {
      _items.update(produc.id, (existingItem) {
        return CartItem(
          id: existingItem.id, 
          title: existingItem.title, 
          quantity: existingItem.quantity + 1, 
          price: existingItem.price
          );
      });
    } else {
      _items.putIfAbsent(
        produc.id,
        () => CartItem(
          id: Random().nextBool().toString(), 
          title: produc.title, 
          quantity: 1, 
          price: produc.price
        ),
      );
    }

    notifyListeners();
  }
}