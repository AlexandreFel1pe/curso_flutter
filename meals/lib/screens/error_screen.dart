import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Ocorreu um erro!',
              style: TextStyle(
                fontSize: 32,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.HOME,
                );
              }, 
              child: Text('Voltar Para Tela Inicial')
            ),
          ],
        ),
      ),
    );
  }
}