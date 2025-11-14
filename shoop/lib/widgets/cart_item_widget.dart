import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.cartitem, super.key});

  final CartItem cartitem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartitem.price}'),
              ),
            ),
          ),
          title: Text(cartitem.title),
          subtitle: Text('Total: R\$ ${(cartitem.price * cartitem.quantity).toStringAsFixed(2)}'),
          trailing: Text('${cartitem.quantity}x'),
        ),
      ),
    );
  }
}