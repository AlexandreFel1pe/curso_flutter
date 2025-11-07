import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({required this.transactions, required this.removeTransaction , super.key});

  final List<Transaction> transactions;
  final void Function(Transaction) removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty ? Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Nenhuma Transação Cadastrada!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index ) {
          final tr = transactions.reversed.toList()[index];
          return Dismissible(
            key: Key(tr.id),
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                        'R\$${tr.value.toStringAsFixed(2)}',
                      ),
                    ),
                  ),
                ),
                title: Text(
                  tr.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(tr.date),
                ),
              ),
            ),
            onDismissed: (value) => removeTransaction(tr),
          );
        }
      ),
    );
  }
}