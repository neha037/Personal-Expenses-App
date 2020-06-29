import 'package:flutter/material.dart';
import '../model/transac.dart';
import 'package:intl/intl.dart';

//This widget is to display the Transaction List
class TransacList extends StatelessWidget {
  final List<Transac> transac;
  final Function deleteTransac;
  TransacList(this.transac, this.deleteTransac);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      child: transac.isEmpty
        ? Card(
          //To display this text when no Transaction is Added.
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
            child: Text(
              " No Transaction Added. Click  On the Add button on the Bar or at the bottom of the Sceen to add Transaction",
              style: TextStyle(
                color: Colors.red[200],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
        : ListView.builder(
            //ListView.builder to to make the transaction list to be able to scroll
            //Builder is used as builder only render the list items that are to be displayed on screen
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 4,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 32,
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: FittedBox(
                      child: Text('₹' + '${transac[index].cost.toStringAsFixed(2)}',),
                    ),
                  ),
                ),
                title: Text(
                  transac[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color:Theme.of(context).accentColor,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transac[index].date),
                ),
                //Icon to delete a Trnsaction 
                trailing: IconButton(
                  icon: Icon(Icons.delete_sweep), 
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTransac(transac[index].sn),
                ),
              ),
            );
          },
          itemCount: transac.length,
        ),
    );
  }
}

