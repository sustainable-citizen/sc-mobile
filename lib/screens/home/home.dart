import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Sustainable Citizen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Sustainable Citizen'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
