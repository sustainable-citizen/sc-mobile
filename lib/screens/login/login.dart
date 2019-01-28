import 'package:flutter/material.dart';
import 'login_service.dart';
import '../../models/user.dart';
import '../navigation.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    //answer from
    // https://stackoverflow.com/questions/51335483/flutter-keyboard-makes-textfield-hide
    return LoginForm();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sustainable Citizen'),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: LoginForm()),
    );
  }
}

// The widget that contains the login form
class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class LoginFormState extends State<LoginForm>
    implements LoginContract {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>(); // Used to validate the form
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // Used to show the snack bar
  String _username, _password;
  User user;
  LoginService _service;

  LoginFormState() {
    _service = LoginService(this);
  }

  void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      _service.attemptLogin(_username, _password);
    }
  }

  void _showSnackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    this.user = user;
    setState(() => _isLoading = false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NavigationScreen(user: this.user)
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    // The button which is pressed to attempt login
    final loginButton = RaisedButton(
      onPressed: _submit,
      child: Text("Login"),
      color: Colors.green,
    );

    // The form feild where the email will be entered
    final emailField = Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        onSaved: (val) => _username = val,
        validator: (val) {
          return val.length == 0 ? "Please enter an email address" : null;
        },
      ),
    );

    // The form feild where the password will be entered
    final passwordFeild = Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Password"),
        onSaved: (val) => _password = val,
        validator: (val) {
          return val.length == 0 ? "Please enter an password" : null;
        },
      ),
    );

    // The entire login form
    final loginForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Login",
          textScaleFactor: 2.0,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              emailField,
              passwordFeild,
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: _isLoading ? CircularProgressIndicator() : loginButton),
      ],
    );





    // Build a Form widget using the _formKey we created above
    return Scaffold(appBar: AppBar(
      title: Text('Sustainable Citizen'),
    ), key: _scaffoldKey, body: Padding(padding: const EdgeInsets.all(16.0), child: loginForm));
  }
}
