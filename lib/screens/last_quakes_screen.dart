import 'package:flutter/material.dart';

class LastQuakes extends StatefulWidget {
  @override
  _LastQuakesState createState() => _LastQuakesState();
}

class _LastQuakesState extends State<LastQuakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Son Depremler'),
      ),
    );;
  }
}
