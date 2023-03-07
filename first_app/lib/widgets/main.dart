import 'package:first_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_list.dart';
import './new_transaction.dart';
void main() {
  //takes a widget and runs it
  runApp(MyApp());
}


class MyApp extends StatelessWidget {



//String titleInput;
//String amountInput;

//Textediting is a class provided by flutter 
final titleController = TextEditingController();
final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title:Text('Money manager')
      ),
      body:Column(
        //SpaceAround: the amount of space betweeen the items is the same
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        //Position items, cross axis aligment, from the right to the left
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //If we want to change the size of a card, we should change the size of the child
        Container(
          width: double.infinity,
          child: Card(
            child: Text('Chart'),
            color: Colors.blue,
            elevation: 5,
            ),
        ),
        //with the .map we convert a list of objects into a list of widgets
        //map will always give you an iterable which we will need tp transform into a list 
        //map takes a function that will be executed on all the elements of that list
        //On the input we get a transaction tx, and we output cards with the text of the title of the transaction 
        //on the card we can define a margin but not a padding
        NewTransaction(),
        TransactionList()
      ],),
    )
    );

  }
}