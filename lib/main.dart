import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new Jeans', amount: 99.99, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        child: Text(
                          '\$${transaction.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(transaction.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
