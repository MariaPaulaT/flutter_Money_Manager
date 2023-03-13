//will hold the text inputs

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final titleController = TextEditingController();

final amountController = TextEditingController();

void submitData(){
  final enteredTitle = titleController.text;
  final enteredAmount= double.parse(amountController.text);

  if(enteredTitle.isEmpty || enteredAmount <= 0){
    return;
  }
    widget.addTx(enteredTitle, enteredAmount);

    //closes the topscreen that is displayed.
    Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  //flutter automatically connectts the controllers with the text fields 
                  controller:titleController,
                  keyboardType:TextInputType.text,
                  onSubmitted: (_)=> submitData,),
                  
                  
                  //onChanged: (val){titleInput=val;},),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType:TextInputType.text, 
                  //(_) for telling flutter that we are getting something but we are not using it 
                  onSubmitted: (_)=> submitData,
                 // onChanged: (val)=> amountInput=val),
                 ),
                 Container(
                  height: 70,
                   child: Row(children: [
                    Text('No Date choosen!'),
                    TextButton(
                      child: Text('Choose Date'),
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor, 
                          fontWeight : FontWeight.bold,
                        )
                      )
                    )
                   ],),
                 ),
                  ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle:  TextStyle(fontSize: 20),
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
            ),
            onPressed: submitData,
            child:  Text('Add Transaction'),
          )
        ]
            
        ),
          ));
  }
} 