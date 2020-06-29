import 'package:flutter/material.dart';
import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';
import './model/transac.dart';
import './widgets/graph.dart';
// A finance App to Store daily expence and represent them
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses Application',
      //Theme of the Application
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.red,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(color: Colors.white),
        )
      ),
      home: HomePage(),
    );
  }
}
//HomePage of the Application starts here
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //List to store Transactions
  final List<Transac> _userTransac = [
  ];
  //To get he latest Transactionn
  List<Transac> get _recentTransac{
    return _userTransac.where((t){
      return t.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList() ;
  }

  //Method to add new Trnsactions to the list
  void _addingNewTransac(String tName, double tCost, DateTime datePicked){
    final newT = Transac(
      sn: DateTime.now().toString() , 
      name: tName, 
      cost: tCost, 
      date: datePicked,
    );
    setState((){
    _userTransac.add(newT);
    });
  }
  //Method to delete Transactions form the list
  void _deleteTransac(String sn){
    setState(() {
      _userTransac.removeWhere((element) => element.sn == sn );
    });
  }

  //Function to bring the Widget to enter Transaction
  void _newTransactionButton(BuildContext ct){
    showModalBottomSheet(
      context: ct, 
      builder: (_) {
        return NewTransac(_addingNewTransac); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        //Adding a button to the AppBar to add the Transaction
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,),
            onPressed: () => _newTransactionButton(context),
          )
        ],
      ),
      //Body of the Application Starts
      body: SingleChildScrollView(
        //Different components are arranged in column format
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //For the Graph widget
            Graph(_recentTransac),
            //This method will trnsfer to build other widget required to desplay and add Transactions
            TransacList(_userTransac, _deleteTransac),
          ],
        ),
      ),
      //A button at the button to add Transaction
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _newTransactionButton(context),
      ),
    );
  }
}
