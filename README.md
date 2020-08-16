# Personal Expenses App

---

It is a Personal Expense Tracking App. It can be used to record and edit daily Transactions.

### Feature - Some notable features are -

    ● There is a graph to represent the data of the past week.
    ● The graph shows last week's transaction relative to one another.
    ● There is an option to delete past Transactions.
    ● Users can pick the previous date to enter their Transaction.
    ● The Transaction list is present in the form of an infinite list to view all previous transactions.


### Concepts Used-

    Flutter Fundamentals-
        ● Compose UI from built-in and custom Widgets
        ● Styling and configuration via arguments
        ● Custom Widgets composing other built-in and custom Widgets.

    Theming
        ● Defining Global Theme for colour and text to use is anywhere in the app via Theme.of(context)
        ● Built-in Widgets use Theme setting automatically

    Styling and Configuring Widgets
        ● Styling and Layout options such as EdgeInsets.all(), BoxDecoration(), enums.. e.t.c.
        ● More them one Widget to get the things done.
        ● Importing external Packages to add custom premade widgets to the application

    Business Logic
        ● Lift state up and use stateful Widgets only when needed
        ● Pass functions references and data around.


### Source Code-

The application contains all the basic files of the Flutter. The code to the application is attached in the appendix.

The first and main file of the application is main.dart file. This is the first file that gets executed and is followed by files called from
main.dart file.

The next file is for accepting new transactions from the user. It is saved as newTransaction.dart.

The model for the Transaction is stored in the file called transac.dart.
The Transaction List widget is called from the main.dart file. It is stored as a transactionList.dart file.

main.dart also calls another widget named as graph.dart to represent a graph of expenditure.

The graph.dart file calls bar.dart file to represent each bar of the graph.

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
