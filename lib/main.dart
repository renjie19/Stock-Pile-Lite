import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(),
    );
  }
}

class StockPileLite extends StatefulWidget {
  @override
  _StockPileLiteState createState() => _StockPileLiteState();
}

class _StockPileLiteState extends State<StockPileLite> {


  @override
  bool get mounted {

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

