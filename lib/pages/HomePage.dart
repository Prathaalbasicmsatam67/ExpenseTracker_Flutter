import 'package:flutter/material.dart';
import '../customs/header.dart';
import '../customs/transaction_card.dart';
import '../customs/new_transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = .55;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      height = .08;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      height = .55;
      _opacity = .9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Header(_addTransaction),
              NewTransaction(_opacity, _done),
            ],
          ),
          TransactionCard(height)
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.short_text),
        onPressed: () {},
      ),
      title: const Text(
        "Personal Finance",
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.bold),
      ),
      actions: [IconButton(icon: Icon(Icons.person_outline), onPressed: () {})],
    );
  }
}
