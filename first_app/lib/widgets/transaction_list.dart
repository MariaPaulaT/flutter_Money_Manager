import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionList extends StatefulWidget {
  
  @override
  TransactionListState createState() => TransactionListState();
}

class TransactionListState extends State<TransactionList> {
  
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
    return Column(children: _userTransactions.map((tx){
          return Card(
            child: Row(children:[
              Container(
                //EdgeInsets, how many space we want to have vertically and how many horizontaly
                margin: EdgeInsets.symmetric(
                  vertical:10, 
                  horizontal:15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width:2, )),
                    padding: EdgeInsets.all(10),
                child: 
                //String interpolation
                Text( '\$ ${tx.amount}',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple)
              ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                    Text(tx.title,  
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold )), 
                   
                  Container(child: 
                  
                  Text(DateFormat.yMMMEd().format(tx.date), 
                  style: TextStyle( 
                    fontSize: 10,
                    color: Colors.blueGrey )
                    )),
                ],)
            ])
            );
        }).toList(),);
  }
}