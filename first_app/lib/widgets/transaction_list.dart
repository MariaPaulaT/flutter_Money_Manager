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
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,),
            child: ListTile(
              leading: CircleAvatar(radius: 30, 
              child:Padding(
                padding: EdgeInsets.all(6), 
                child: FittedBox(
                  child: Text('\$${transactions[index].amount}')),
              )
              ),
              title: Text(transactions[index].title, 
              style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
            ),
          );
        },
        itemCount: transactions.length,
       ),
    );
  }
}