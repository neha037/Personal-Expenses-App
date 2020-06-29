import 'package:flutter/material.dart';

//This file is to hold bars of the Graph
class Bar extends StatelessWidget {
  final double expenditure;
  final double percentOfTotal;
  final String label;
  Bar(this.label, this.expenditure, this.percentOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 21,
          child: FittedBox(
            child: Text(
              '₹ ' + '${expenditure.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        //Designing Box
        Container(
          height: 58,
          width: 11,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
        )
      ],
    );
  }
}
