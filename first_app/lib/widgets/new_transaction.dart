//will hold the text inputs

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
 final titleController = TextEditingController();
final amountController = TextEditingController();

final Function addTx;

NewTransaction(this.addTx);

void submitData(){
   addTx(titleController.text, double.parse(amountController.text),);
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
                  TextButton(
            style: TextButton.styleFrom(
              textStyle:  TextStyle(fontSize: 20),
              primary: Colors.purple,
            ),
            onPressed: submitData,
            child:  Text('Add Transaction'),
          )
        ]
            
        ),
          ));
  }
} 