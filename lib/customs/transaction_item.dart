import 'package:flutter/material.dart';
import '../providers/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: leadingIcon(),
        title: transactionTitle(),
        subtitle: transactionCategory(),
        trailing: transactionValue(),
      ),
    );
  }

  Text transactionValue() {
    return Text(
        '\$${transaction.value}',
        style: const TextStyle(
          color: Colors.red,
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
  }

  Text transactionCategory() {
    return Text(
        transaction.category,
        style:const TextStyle(
          fontSize: 12,
        ),
      );
  }

  Text transactionTitle() {
    return Text(
        transaction.title,
        style:const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );
  }

  Container leadingIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: transaction.color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12)),
      alignment: Alignment.center,
      child: Icon(
        transaction.iconData,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
