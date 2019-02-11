import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'logout_service.dart';

class ProfileWidget extends StatelessWidget {
  User user;
  LogoutService _service = LogoutService(_view);

  ProfileWidget({Key key, this.user});

  void _submit() {
    _service.attemptLogout(user);

  }

  void onLogoutSuccess(User user) async {
    this.user = null;
//    Navigator.pushReplacement(
//        null,
//        MaterialPageRoute(
//            builder: (context) => NavigationScreen(user: this.user)
//        )
//    );
  }

  @override
  Widget build(BuildContext context) {
    // The button which is pressed to attempt logout
    final logoutButton = RaisedButton(
      onPressed: _submit,
      child: Text("Logout"),
      color: Colors.green,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text(
              "\nThank you!\n",
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
            ),
            logoutButton,
          ],
        ),
      ),
      )
    );
  }
}