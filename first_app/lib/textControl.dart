//button

import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
final Function selectHandler;
final String answerText;

TextControl(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
),
    child: Text('Cambiar nombre'),
    onPressed: selectHandler,
),

      );
  }
}

