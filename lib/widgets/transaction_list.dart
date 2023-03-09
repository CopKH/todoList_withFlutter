import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widget_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;
  const TransactionList(this.transactions, {super.key, required this.delete});
  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "ยังไม่มีรายการ",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          });
    } else {
      return ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      return delete(transactions[index].id);
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}'))),
                  ),
                ),
              );
            },
            // itemBuilder: (ctx, index) {
            //   return Card(
            //     child: Row(
            //       children: [
            //         Container(
            //           width: 110,
            //           margin: const EdgeInsets.symmetric(
            //               vertical: 10, horizontal: 15),
            //           decoration: BoxDecoration(
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(5)),
            //               border: Border.all(
            //                   color: Theme.of(context).primaryColor,
            //                   width: 2)),
            //           padding: const EdgeInsets.all(10),
            //           child: Text(
            //             '\$${transactions[index].amount.toStringAsFixed(2)}',
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //                 color: Theme.of(context).primaryColor),
            //           ),
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               transactions[index].title,
            //               style: const TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Text(
            //               DateFormat('dd MMMM yyyy')
            //                   .format(transactions[index].date),
            //               // data.date.toIso8601String(),
            //               style: const TextStyle(color: Colors.grey),
            //             )
            //           ],
            //         )
            //       ],
            //     ),
            //   );
            // },
            itemCount: transactions.length,
          );
    }
  }
}
