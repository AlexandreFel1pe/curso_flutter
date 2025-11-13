import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({required this.showFavoriteOnly});
  final bool showFavoriteOnly;

  @override
  Widget build(BuildContext context) {
    final productsProivder = Provider.of<Products>(context);
    final products = showFavoriteOnly ? productsProivder.favoriteItems : productsProivder.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}