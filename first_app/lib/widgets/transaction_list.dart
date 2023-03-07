import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionList extends StatelessWidget {

//To receive the transactions
final List<Transaction> transactions; 

//constructure
TransactionList(this.transactions);

 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(children: transactions.map((tx){
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
          }).toList(),),
    );
  }
}