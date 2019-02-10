import 'package:flutter/material.dart';
import '../../models/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  bool _isLoading = false;

  ProfileWidget({Key key, this.user});


  void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      //_service.attemptLogin(_username, _password);
    }
  }

  // The button which is pressed to attempt login
  final logoutButton = RaisedButton(
    onPressed: _submit,
    child: Text("Logout"),
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
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