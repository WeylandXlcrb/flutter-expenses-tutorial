import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (_, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      removeTransaction: removeTransaction,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (ctx, idx) {
    //       return TransactionItem(
    //         key: ValueKey(transactions[idx].id),
    //         transaction: transactions[idx],
    //         removeTransaction: removeTransaction,
    //       );
    //       // return Card(
    //       //   child: Row(
    //       //     children: [
    //       //       Container(
    //       //         margin: EdgeInsets.symmetric(
    //       //           vertical: 10,
    //       //           horizontal: 15,
    //       //         ),
    //       //         padding: EdgeInsets.all(10),
    //       //         decoration: BoxDecoration(
    //       //           border: Border.all(
    //       //             color: Theme.of(context).primaryColor,
    //       //             width: 2,
    //       //           ),
    //       //         ),
    //       //         child: Text(
    //       //           '\$${transactions[idx].amount.toStringAsFixed(2)}',
    //       //           style: TextStyle(
    //       //             fontWeight: FontWeight.bold,
    //       //             fontSize: 20,
    //       //             color: Theme.of(context).primaryColor,
    //       //           ),
    //       //         ),
    //       //       ),
    //       //       Column(
    //       //         crossAxisAlignment: CrossAxisAlignment.start,
    //       //         children: [
    //       //           Text(
    //       //             transactions[idx].title,
    //       //             style: Theme.of(context).textTheme.headline6,
    //       //           ),
    //       //           Text(
    //       //             DateFormat.yMMMd().format(transactions[idx].date),
    //       //             style: TextStyle(color: Colors.grey),
    //       //           ),
    //       //         ],
    //       //       ),
    //       //     ],
    //       //   ),
    //       // );
    //     },
    //     itemCount: transactions.length,
    //   );
  }
}
