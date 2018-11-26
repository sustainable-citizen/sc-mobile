import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );

    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut
    );

    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sustainable Citizen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoginForm()
      ),
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
class LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Validate will return true if the form is valid, or false if
  // the form is invalid.
  void attemptLogin() {
    if (_formKey.currentState.validate()) {
      // If the form is valid, we want to show a Snackbar
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text(emailController.text),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: new InputDecoration(
              labelText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter an email address';
              }
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: new InputDecoration(
              labelText: "Password",
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a password';
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: attemptLogin,
              child: Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}
