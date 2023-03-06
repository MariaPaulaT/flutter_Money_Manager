
import 'package:flutter/material.dart';

class Textico extends StatelessWidget {
  final String questionText;

  Textico(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
      questionText,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    )
    );
  }
}
