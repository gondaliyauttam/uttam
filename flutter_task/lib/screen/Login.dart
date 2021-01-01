import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_task/controller/login_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  Logincontroller _con;
  _LoginState() : super(Logincontroller()) {
    _con = controller;
  }
  bool isloggedin = false;
  Map userprofile;
  final facebookLogin = FacebookLogin();

  _login() async {
    // Let's force the users to login using the login dialog based on WebViews. Yay!
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        _con.sociallogbutton();
        setState(() {
          userprofile = profile;
          isloggedin = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isloggedin = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => isloggedin = false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _con.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                onSaved: (input) => _con.log.email = input,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "email",
                    labelText: "email"),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                onSaved: (input) => _con.log.password = input,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password"),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Login',
                  textScaleFactor: 1.2,
                ),
                onPressed: () {
                  _con.loginbutton();
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Facebook',
                  textScaleFactor: 1.2,
                ),
                onPressed: () {
                  _login();
                  // _con.sociallogbutton();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
