import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTx);
  final List<Transaction> transactions;
  final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (builder, constraints) {
              return Column(children: <Widget>[
                Text(
                  "No transaction added yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ]);
            })
          : ListView(
              children: [
                ...transactions.map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transactions: tx,
                    deleteTx: deleteTx,
                  ),
                )
              ],
            ),
    );
  }
}
