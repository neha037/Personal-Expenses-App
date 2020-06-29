import 'package:flutter/material.dart';
import '../model/transac.dart';
import 'package:intl/intl.dart';
import './bar.dart';

//This File is to display the chart/Graph of the expenses
class Graph extends StatelessWidget {
  final List<Transac> recentTransac;
  //Constructor to recive recant transaction
  Graph(this.recentTransac);
  // A list tp generate days with expenditure on that particular day in the last week
  List<Map<String, Object>> get transacValue {
    //to generate list of 7 elements that represent 7 days of the week
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double total = 0;
      // Loop to find out transaction on a particular day
      for (var i = 0; i < recentTransac.length; i++) {
        if (recentTransac[i].date.day == weekday.day &&
            recentTransac[i].date.month == weekday.month &&
            recentTransac[i].date.year == weekday.year) {
          total += recentTransac[i].cost;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'expenditure': total
      };
    }).reversed.toList();
  }

  double get spendingTotal {
    return transacValue.fold(0.0, (total, item) {
      return total + item['expenditure'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //Card that will display the Graph/Chart
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transacValue.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: Bar(
                  e['day'],
                  e['expenditure'],
                  spendingTotal == 0
                      ? 0.0
                      : (e['expenditure'] as double) / spendingTotal,
                ),
              );
            }).toList()),
      ),
    );
  }
}
