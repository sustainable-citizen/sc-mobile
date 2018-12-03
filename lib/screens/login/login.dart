import 'package:flutter/material.dart';
import '../../auth.dart';
import '../../models/user.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sustainable Citizen'),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: LoginForm()),
    );
  }
}

// Define a Custom Form Widget
class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class LoginFormState extends State<LoginForm>
    implements LoginContract, AuthStateListener {
  BuildContext _context;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _username, _password;
  LoginPresenter _presenter;

  LoginFormState() {
    _presenter = LoginPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      _presenter.attemptLogin(_username, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var loginButton = RaisedButton(
      onPressed: _submit,
      child: Text("Login"),
      color: Colors.green,
    );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: "Email"),
                  onSaved: (val) => _username = val,
                  validator: (val) {
                    return val.length == 0
                        ? "Please enter an email address"
                        : null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  onSaved: (val) => _password = val,
                  validator: (val) {
                    return val.length == 0
                        ? "Please enter an password"
                        : null;
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: _isLoading ? new CircularProgressIndicator() : loginButton
        ),
      ],
    );

    // Build a Form widget using the _formKey we created above
    return Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: loginForm
    );
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() => _isLoading = false);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }
}
