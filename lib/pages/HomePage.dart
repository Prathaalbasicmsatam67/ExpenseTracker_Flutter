import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_expensetracker/pages/FinanceDashboard.dart';
import 'package:flutter_app_expensetracker/pages/TodoDashboard.dart';
import '../customs/header.dart';
import '../customs/transaction_card.dart';
import '../customs/new_transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    FinanceDashboard(),
    TodoDashboard(),
    Center(
      child: Text('Location'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), label: 'Finance'),
            BottomNavigationBarItem(
                icon: Icon(Icons.toc), label: 'Todo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: 'Location'),
          ],
        ),
        body: tabs[_currentIndex],
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
