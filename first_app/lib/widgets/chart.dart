import './chart_bar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    //genarate generates a list of the lenght specified, and for each element they will call a functio
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days:index),);
      var totalSum = 0.0;

      for(var i=0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day &&  recentTransactions[i].date.month == weekDay.day ){
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day':DateFormat.E().format(weekDay).substring(0, 2),  
        'amount': totalSum,
        };
    }
    );
  } 

  double get totalSpending{
    //Change a list to another type
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, 
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data){
            return Flexible(
              //to restrict how much space the bar could take. 
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'], 
                data['amount'], 
                totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ));
  }
}