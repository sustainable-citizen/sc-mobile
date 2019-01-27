import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sustainable Citizen';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.green),
      routes: routes,
    );
  }
}
