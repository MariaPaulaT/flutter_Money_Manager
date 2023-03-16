

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main(){
//Esto hace que nose pueda rotar el telefono
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([
   // DeviceOrientation.portraitUp,
  //  DeviceOrientation.portraitDown, 
  //]);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Money Manager',
      
      theme: ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.amber,
  fontFamily: 'Quicksand',
  textTheme: ThemeData.light().textTheme.copyWith(
    headline6: TextStyle(
      fontFamily: 'OpenSans', 
      fontWeight: FontWeight.bold, 
      fontSize: 18)
  ),
),
    home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    
  ];

bool _showChart= false;
List<Transaction> get _recentTransaction{
  //where lets you run a list and if the element is true, the element is kept in the list
  return _userTransactions.where((transac){
    return transac.date.isAfter(
      DateTime.now().subtract(Duration(days:7)));
  }).toList();
}
  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

    void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

void _deleteTransaction(String id){
  setState(() {
    //remove where goes through all the list
  _userTransactions.removeWhere((tx) {
    return tx.id == id;
  });
  });

}
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = MediaQuery.of(context).orientation== Orientation.landscape;
    //i put the app bar in an object because the app bar has info about the app bar size
    final appBar= AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      );
     final txtListWidget = Container(
              height: (mediaQuery.size.height-
              appBar.preferredSize.height-mediaQuery.padding.top)*0.7,
              child: TransactionList(_userTransactions, _deleteTransaction)); 
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //SpaceAround: the amount of space betweeen the items is the same
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //Position items, cross axis aligment, from the right to the left
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if(isLandscape)  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text('Show chart'),
              Switch(
               value: _showChart,
               onChanged:(val){
                setState(() {
                  _showChart= val; 
                });
              } ,)
            ]),
            if(!isLandscape) Container(
              height: (
                mediaQuery.size.height-appBar.preferredSize.height
                - mediaQuery.padding.top)*0.3,
              child: Chart(_recentTransaction)
              ),
              if(!isLandscape) txtListWidget,
              if(isLandscape) _showChart? 
              Container(
              height: (
                mediaQuery.size.height-appBar.preferredSize.height
                - mediaQuery.padding.top)*0.7,
              child: Chart(_recentTransaction))  
             //with the .map we convert a list of objects into a list of widgets
          //map will always give you an iterable which we will need tp transform into a list 
          //map takes a function that will be executed on all the elements of that list
          //On the input we get a transaction tx, and we output cards with the text of the title of the transaction 
          //on the card we can define a margin but not a padding
            :txtListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
