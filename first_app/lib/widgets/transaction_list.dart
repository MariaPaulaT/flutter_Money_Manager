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
      //List view should always have a height
      //Listview.builder only loads whats visible, so its good for large lists 
      //flutter now nows that it should execute itemBuilder the times that itemCount says
      //for each time it passses throgh the method it will return a widget
      child: ListView.builder(
        itemBuilder:(ctx, index){
          return Card(
              child: Row(children:[
                Container(
                  //EdgeInsets, how many space we want to have vertically and how many horizontaly
                  margin: EdgeInsets.symmetric(
                    vertical:10, 
                    horizontal:15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width:2, )),
                      padding: EdgeInsets.all(10),
                  child: 
                  //String interpolation
                  Text( '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor)
                ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                      Text(transactions[index].title,  
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold )), 
                     
                    Container(child: 
                    
                    Text(DateFormat.yMMMEd().format(transactions[index].date), 
                    style: TextStyle( 
                      fontSize: 10,
                      color: Colors.blueGrey )
                      )),
                  ],)
              ])
              );
        },
        itemCount: transactions.length,
       ),
    );
  }
}