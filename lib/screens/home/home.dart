import 'package:flutter/material.dart';


class HomeWidget extends StatelessWidget {
  static const IconData arrow_downward = IconData(0xe5db, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final greenText =TextStyle(
      color: Colors.green
    );

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
                "Welcome Sustainable Citizen!",
                textScaleFactor: 3.0,
                textAlign: TextAlign.center,
                style: greenText,
              ),
              Text(
                "\nThis app will guide you towards your sustainable goals and become an eco leader within your community!",
                textScaleFactor: 2.0,
                textAlign: TextAlign.center,
                style: greenText,
              ),
              Text(
                "\nAre you ready for your first challenge?\n",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: greenText,
              ),
              new Icon(arrow_downward),
            ],
          ),
        ),
      )
    );
  }
}
