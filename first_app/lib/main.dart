import 'package:flutter/material.dart';
import './Transaction.dart';
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
    date: DateTime.now(),),
     Transaction(id: 't2', 
    title: 'Weekly grocery', 
    amount: 200, 
    date: DateTime.now(),)
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
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
        //with the .map we convert a list of objects into a list of widgets
        //map will always give you an iterable which we will need tp transform into a list 
        //map takes a function that will be executed on all the elements of that list
        //On the input we get a transaction tx, and we output cards with the text of the title of the transaction 
        Column(children: transactions.map((tx){
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
                Text(tx.amount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple)
              ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal:10,
                    ),
                    child: 
                    Text(tx.title,  
                    style: TextStyle(
                      fontSize: 15 )), 
                   ),
                  Container(child: 
                  Text(tx.date.toString(), 
                  style: TextStyle( 
                    fontSize: 10,
                    color: Colors.blueGrey )
                    )),
                ],)
            ])
            );
        }).toList(),)
      ],),
    )
    );

  }
}