import 'package:flutter/material.dart';
import 'package:shop/widgets/app_drawer.dart';

class OrdesScreen extends StatelessWidget {
  const OrdesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
    );
  }
}