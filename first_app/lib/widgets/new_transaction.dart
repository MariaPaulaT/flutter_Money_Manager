//will hold the text inputs

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final _titleController = TextEditingController();

final _amountController = TextEditingController();

DateTime _selectedDate;
void _submitData(){
  final enteredTitle = _titleController.text;
  final enteredAmount= double.parse(_amountController.text);

if (_amountController.text.isEmpty)
{

}  

if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null ){
    return;
  }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    //closes the topscreen that is displayed.
    Navigator.of(context).pop();
}

void _presentDatePicker(){
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2019), 
    lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(){
        _selectedDate= pickedDate;
      }
     
    });
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
                  controller:_titleController,
                  keyboardType:TextInputType.text,
                  onSubmitted: (_)=> _submitData,),
                  
                  
                  //onChanged: (val){titleInput=val;},),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType:TextInputType.text, 
                  //(_) for telling flutter that we are getting something but we are not using it 
                  onSubmitted: (_)=> _submitData,
                 // onChanged: (val)=> amountInput=val),
                 ),
                 Container(
                  height: 70,
                   child: Row(children: [
                    Expanded(
                      child: Text(_selectedDate == null ? 'No Date choosen!':
                       'Picked Date: ${DateFormat.yMd().format(_selectedDate)}' ),
                    ),
                    TextButton(
                      child: Text('Choose Date'),
                      onPressed: (){
                        _presentDatePicker();
                        },
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
            onPressed: _submitData,
            child:  Text('Add Transaction'),
          )
        ]
            
        ),
          ));
  }
} 