import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//This is a widget to accept new Transaction from the user
class NewTransac extends StatefulWidget {
  final Function addtran;

  NewTransac(this.addtran);

  @override
  _NewTransacState createState() => _NewTransacState();
}

class _NewTransacState extends State<NewTransac> {
  final titleControl = TextEditingController();

  final costControl = TextEditingController();
  DateTime _dateSelected;

  void _submitResponse() {
    final titleEntered = titleControl.text;
    final costEntered = double.parse(costControl.text);
    //Condition to check if the values are corectelly Entered
    if (titleEntered.isEmpty || costEntered <= 0 || _dateSelected == null) {
      return;
    }
    //Function to enter the transaction
    widget.addtran(
      titleEntered,
      costEntered,
      _dateSelected
    );
    //To clode the New Transaction Sheet so we don't have to do it manually
    //This function closes the top most sheet on the screen
    Navigator.of(context).pop();
  }

  //Method for Date Picker
  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _dateSelected = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(11),
        //Column widget to display all the components of the Transaction widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //Text Field to add the Name of the poduct
            TextField(
              decoration: InputDecoration(labelText: 'Name of Item'),
              controller: titleControl,
            ),
            //Text Field to enter the cost of the Item
            TextField(
              decoration: InputDecoration(labelText: 'Cost'),
              controller: costControl,
              //To set keyboard to enter number
              keyboardType: TextInputType.number,
              // To submit on enter
              onSubmitted: (_) => _submitResponse(),
            ),
            //Widget to add date for the Transaction
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _dateSelected == null
                          ? 'No Date Selected!'
                          : "Date Picked: ${DateFormat.yMd().format(_dateSelected)}",
                    ),
                  ),
                  FlatButton(
                    onPressed: _datePicker,
                    child: Text(
                      'Select Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  )
                ],
              ),
            ),
            //Button to add the Transaction to the Transaction List
            RaisedButton(
              onPressed: _submitResponse,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
