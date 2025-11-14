import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('COMPRAR'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (ctx, i) => CartItemWidget(cartitem: cartItems[i]),
            ),
          ),
        ],
      ),
    );
  }
}