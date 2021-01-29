import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/pages/LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final height = MediaQuery.of(context).size.height;
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginScreen())));

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primary, primary],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Text(
                'Personal Expense Tracker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'quicksand',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
