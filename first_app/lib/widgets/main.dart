import 'package:first_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';


void main() {
  //takes a widget and runs it
  runApp(MyApp());
}


class MyApp extends StatefulWidget {



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//String titleInput;
//final titleController = TextEditingController();

//final amountController = TextEditingController();

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
   

  void _addNewTrans(String txTitle, double txAmount){
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now(),
      id: DateTime.now().toString()
      );

      //since its a final, we cannot do this userTransaction = ... because it will hold a new pointer
      setState(() {
        _userTransactions.add(newTx);
      });
      
  }

void  _startAddNewTransaction(BuildContext ctx){
  //its a widget that  will appear on the screen
  showModalBottomSheet(context: ctx, builder: (bCtx){
    return GestureDetector(
      onTap: (){},
      child: NewTransaction(_addNewTrans),
      behavior: HitTestBehavior.opaque,);
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title:Text('Money manager'),
        //takes a list of widgets
        actions:[
          IconButton(icon: Icon(Icons.add),
          onPressed:()=>_startAddNewTransaction(context))
        ]
      ),
      //singlechildscroll can only be here
      body:SingleChildScrollView(
        child: Column(
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
          TransactionList(_userTransactions),
        ],),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
    )
    );

  }
}