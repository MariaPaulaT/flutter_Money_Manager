import 'package:flutter/material.dart';
import './transaction.dart';
void main() {
  //takes a widget and runs it
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

final List<Transaction> transactions =[
  Transaction(
    id: 't1', 
    title: 'New Shoes', 
    amount: 69.99, 
    date: DateTime.now(),)
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Money manager')
      ),
      body:Column(
        //SpaceAround: the amount of space betweeen the items is the same
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        Card(
          color: Colors.red,
          child: Text('LL'),
          )
      ],),
    );

  }
}