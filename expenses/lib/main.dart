import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent),
          fontFamily: 'Quicksand',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'Capa', value: 100, date: DateTime.now()),
    Transaction(id: '2', title: 'Calça', value: 200, date: DateTime.now()),
    Transaction(id: '3', title: 'Capacete', value: 500, date: DateTime.now()),
    Transaction(id: '4', title: 'Blusa', value: 50, date: DateTime.now()),
    Transaction(id: '5', title: 'Boné', value: 25, date: DateTime.now()),
    Transaction(id: '6', title: 'Chapeu', value: 80, date: DateTime.now()),
    Transaction(id: '7', title: 'Chinelo', value: 15, date: DateTime.now()),
    Transaction(id: '8', title: 'Sandalia', value: 140, date: DateTime.now()),
    Transaction(id: '9', title: 'Sapato', value: 360, date: DateTime.now()),
    Transaction(id: '19', title: 'Bermuda', value: 67, date: DateTime.now()),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }
  
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) {
        return TransactionForm(onSubmit: _addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: [
        if (isLandscape) Container(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.pie_chart),
            color: Colors.white,
            onPressed: () {
              setState(() {
                _showChart  = !_showChart;
              });
            }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () => _openTransactionFormModal(context)),
        ),
      ],
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );

    final availableHeight = MediaQuery.of(context).size.height
      - appBar.preferredSize.height - MediaQuery.of(context).padding.vertical;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: max(0, 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isLandscape) Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Exibir Gráfico'),
                      Switch(
                        value: _showChart,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            _showChart = value;
                          });
                        },
                      ),
                    ],
                  ),
                  if (_showChart || !isLandscape) Container(
                    height: availableHeight * (isLandscape ? 0.70 : 0.30),
                    child: Chart(recentTransaction: _recentTransactions),
                  ),
                  if (!_showChart || !isLandscape) Container(
                    height: availableHeight * 0.7,
                    child: TransactionList(transactions: _transactions, removeTransaction: _removeTransaction),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}