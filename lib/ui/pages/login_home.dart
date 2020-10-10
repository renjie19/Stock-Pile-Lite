import 'package:flutter/material.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Test'),
        ),
      ),
    );
  }
}
