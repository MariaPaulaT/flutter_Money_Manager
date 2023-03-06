//Its not a widget, its an object that we will like to use in our code
import 'package:flutter/foundation.dart';

class Transaction{
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount,
    @required this.date,
    });

}