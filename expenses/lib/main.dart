import 'dart:math';
import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {}),
          ),
        ],
        title: Text(
          'Despesas Pessoais',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: max(0, 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Text(
                      'Grafico',
                    ),
                  ),
                ),
                TransactionUser(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}