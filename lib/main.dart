import 'package:flutter/material.dart';
import 'package:stockpilelite/stock_pile_lite.dart';
import 'package:stockpilelite/ui/pages/login_home.dart';

void main() async {
  runApp(MyApp());
  await StockPileLite.initialize();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginHome(),
    );
  }
}
