import 'package:flutter/foundation.dart';
// A class Transac to define a blueprint of how a transaction should be
class Transac{
  final String sn;
  final String name;
  final double cost;
  final DateTime date;

  Transac({
    @required this.sn, 
    @required this.name, 
    @required this.cost, 
    @required this.date,
  });
}