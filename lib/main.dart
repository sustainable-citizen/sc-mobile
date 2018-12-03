import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sustainable Citizen';
    return new MaterialApp(
      title: appTitle,
      theme: new ThemeData(primarySwatch: Colors.green),
      routes: routes,
    );
  }
}
