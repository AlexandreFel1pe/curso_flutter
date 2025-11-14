import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product produc) {
    if(_items.containsKey(produc.id)) {
      _items.update(produc.id, (existingItem) {
        return CartItem(
          id: existingItem.id, 
          productId: produc.id,
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
          productId: produc.id,
          title: produc.title, 
          quantity: 1, 
          price: produc.price
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    
    notifyListeners();
  }
}