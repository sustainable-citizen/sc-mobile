import 'package:flutter/material.dart';
import '../../models/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;

  ProfileWidget({Key key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Profile Coming Soon!"),
        ),
      ),
    );
  }
}
