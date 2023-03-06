// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './text.dart';
import './textControl.dart';
void main() {
  //takes a widget and runs it
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{

  var text = 'Soy Maria';

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Challenge'),
        ),
        body: Column(children: [
          Text(text),
         TextControl(selectHandler, text),

        ],)
      )
      );

  }



  String selectHandler() {

   setState(() {
        if(text == 'Soy Juan'){
          text = 'Soy Maria';
        }else{
           text = 'Soy Juan';
        }
   });

   return text;
  }
}