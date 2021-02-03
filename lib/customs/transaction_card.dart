
import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/customs/transaction_item.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import '../providers/transaction.dart';

class TransactionCard extends StatefulWidget {
  final double height;

  const TransactionCard(this.height);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  int _date = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final providerTransaction = Provider.of<Transactions>(context);

    return Positioned(
      // top: mediaQuery.size.height * widget.height,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        width: mediaQuery.size.width * .94,
        height: mediaQuery.size.height * widget.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Column(
          children: [
            Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4, right: 12),
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => setState(() {
                            _date--;
                          }),
                          child: const Icon(Icons.arrow_left),
                        ),
                        Text('$_date ${DateFormat('MMMM yyyy').format(DateTime.now())}',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'montserrat'),
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            _date++;
                          }),
                          child: const Icon(Icons.arrow_right),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: providerTransaction.transactions.length,
                  itemBuilder: (context, i) {
                    return TransactionItem(providerTransaction.transactions[i]);
                  }),
            )
          ],
        ),
      ),
      bottom: 0,
      left: mediaQuery.size.width * 0.03,
    );
  }
}
