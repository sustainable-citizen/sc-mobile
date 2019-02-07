import 'package:flutter/material.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text(
                "Welcome to",
                textScaleFactor: 3.0,
                textAlign: TextAlign.center,
              ),
              Text(
                "Sustainable Citizen!",
                textScaleFactor: 4.0,
                textAlign: TextAlign.center,
              ),
              Text(
                "\nThank you for being a member of the Sustainable Citizen testing team!",
                textScaleFactor: 2.0,
                textAlign: TextAlign.center,
              ),
              Text(
                "\nCheck out your challenges to get started.Make sure you record when you complete them!",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      )
    );
  }
}
