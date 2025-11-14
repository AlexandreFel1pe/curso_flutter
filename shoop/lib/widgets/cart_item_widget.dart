import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.cartitem, super.key});

  final CartItem cartitem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartitem.id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 20,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
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
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
          .removeItem(cartitem.productId);
      },
    );
  }
}