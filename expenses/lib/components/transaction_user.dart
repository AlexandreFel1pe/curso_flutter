import 'dart:math';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 1',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 2',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 3',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 4',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 5',
      value: 211.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de 6',
      value: 211.3,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: _addTransaction),
        TransactionList(transactions: _transactions, removeTransaction: _removeTransaction),
      ],
    );
  }
}