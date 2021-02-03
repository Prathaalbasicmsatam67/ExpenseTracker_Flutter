import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/customs/header.dart';
import 'package:flutter_app_expensetracker/customs/new_transaction.dart';
import 'package:flutter_app_expensetracker/customs/transaction_card.dart';

class FinanceDashboard extends StatefulWidget {
  @override
  _FinanceDashboardState createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  double height = .47;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      height = .08;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      height = .47;
      _opacity = .9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Header(_addTransaction),
            NewTransaction(_opacity, _done),
          ],
        ),
        TransactionCard(height),
      ],
    );
  }
}
