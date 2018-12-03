import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sustainable Citizen';
    return new MaterialApp(
      title: appTitle,
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}