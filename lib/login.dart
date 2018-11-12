import 'package:flutter/material.dart';
import 'webapi.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  AWSWebAPI webAPI = new AWSWebAPI();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login_background.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            new Text(
              'Sustainable Citizen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
            new Form(
              child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.green,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0))),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _usernameController,
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 10.0)),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 50.0)),
                        new MaterialButton(
                          color: Colors.white,
                          splashColor: Colors.green,
                          child: new Text("Login",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)),
                          onPressed: () async {
                            var result = await webAPI.login(
                                _usernameController.text,
                                _passwordController.text);
                            if (result == true) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Success'),
                                        content: Text('accesstoken:' +
                                            accessToken +
                                            '\nrefreshtoken:' +
                                            refreshToken),
                                      ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('fail'),
                                        content: Text('fail'),
                                      ));
                            }
                          },
                        )
                      ]),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
