import 'package:first_app/widgets/new_transaction.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';
class UserTransactions extends StatefulWidget {
  
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

   final List<Transaction> _userTransactions= [
 Transaction(
    id: 't1', 
    title: 'New Shoes', 
    amount: 69.99, 
    date: DateTime.now(),),
     Transaction(id: 't2', 
    title: 'Weekly grocery', 
    amount: 200, 
    date: DateTime.now(),)
  ];
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(),
      ],
    );
  }
}