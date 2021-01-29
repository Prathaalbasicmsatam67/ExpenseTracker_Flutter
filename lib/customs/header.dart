import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app_expensetracker/models/expense.dart';

import 'expense_chart.dart';

class Header extends StatelessWidget {
  final Function addTransaction;
  const Header(this.addTransaction);


  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
        id: 'Expense',
        domainFn: (Expense _expense, _) => _expense.category,
        measureFn: (Expense _expense, _) => _expense.value,
        labelAccessorFn: (Expense _expense, _) => '\$${_expense.value}',
        colorFn: (Expense _expense, _) =>
            charts.ColorUtil.fromDartColor(_expense.color),
        data: [
          Expense('Buisness', 149.00, Color(0xff40bad5)),
          Expense('Meals', 143.00, Color(0xffe8505b)),
          Expense('Gifts', 49.00, Color(0xfffe91ca)),
          Expense('Gaming', 27.35, Color(0xfff6d743)),
          Expense('Entertainment', 34.99, Color(0xfff57b51)),
         
        ])
  ];

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * .4,
      color: primary,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildExpenseChart(),
            separator(),
            buildButtonsForActions(primary),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: const Text('Transactions',
              style: TextStyle(fontSize: 16,
              fontFamily: 'montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,

              ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildButtonsForActions(Color primary) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildAddTransactionButton(),
        buildReportButton(primary)
      ],
    );
  }

  FlatButton buildReportButton(Color primary) {
    return FlatButton(
        color: Colors.white,
        onPressed: () {},
        child: Container(
          width: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reports',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: primary,
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: primary,
              )
            ],
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      );
  }

  OutlineButton buildAddTransactionButton() {
    return OutlineButton(
        onPressed: addTransaction,
        borderSide: const BorderSide(width: 1, color: Colors.white),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          width: 127,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.playlist_add,
                color: Colors.white,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
  }

  SizedBox separator() {
    return const SizedBox(
      height: 14,
    );
  }

  Container buildExpenseChart() {
    return Container(
      height: 150,
      child: ExpenseChart(
        _series,
        animate: true,
      ),
    );
  }
}
