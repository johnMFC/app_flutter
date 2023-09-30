import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';


class Chart extends StatelessWidget {
  
  final List<Transaction>recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String,Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
       Duration(days: index),  
      );

      double totalSum = 0.0;

      for(var i = 0; i < recentTransaction.length; i++){
      bool samDay =  recentTransaction[i].date.day == weekDay.day;
      bool sameMonth = recentTransaction[i].date.month == weekDay.month;
      bool samYear =  recentTransaction[i].date.year == weekDay.year;

       if (samDay && sameMonth && samYear){
       totalSum += recentTransaction[i].value;
         
       }
      }


      return {
        'day':DateFormat.E().format(weekDay)[0],
        'value':totalSum,
        };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
        margin:EdgeInsets.all(20),
         child: Row(
          children: groupedTransactions.map((tr){
            return ChartBar(
              label: tr['day'] as String,
              value: tr['value'] as double,
              percentage:0,
            );
          }).toList(),
         ),
    );
  }
}