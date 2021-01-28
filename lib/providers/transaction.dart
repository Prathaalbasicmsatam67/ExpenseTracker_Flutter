import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  const Transaction(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.category,
      @required this.iconData,
      @required this.color});
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(id: 1, title: 'Dinner', value: 128.0, category: 'Meals', iconData: Icons.fastfood, color: Color(0xffe8505b)),
    Transaction(id: 2, title: 'Birthday Present', value: 49.0, category: 'Gifts', iconData: Icons.card_giftcard, color: Color(0xfff6d743)),
    Transaction(id: 3, title: 'Software', value: 128.0, category: 'Business', iconData: Icons.work, color: Color(0xff40bad5)),
    Transaction(id: 4, title: 'Books', value: 128.0, category: 'Entertainment', iconData: Icons.casino, color: Color(0xfff57b51)),
  ];
  List<Transaction> get transactions {
    return _transactions;
  }
}
