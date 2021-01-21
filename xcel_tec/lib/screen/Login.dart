import 'package:flutter/material.dart';
import 'package:xcel_tec/screen/register.dart';
import 'package:xcel_tec/controller/login_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  Logincontroller _con;
  _LoginState() : super(Logincontroller()) {
    _con = controller;
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _con.loginFormKey,
              child: ListView(
                children: [
                  Container(
                    child: Center(child: Image.asset('assets/xcel_tec.png')),
                    height: 180,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onSaved: (input) => _con.log.username = input,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      filled: false,
                      labelText: 'User name',
                      hintText: 'User name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter user Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: _obscureText,
                    onSaved: (input) => _con.log.password = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      filled: false,
                      labelText: 'Password',
                      hintText: 'Password',
                      suffixIcon: new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: new Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.green,
                        child: Text(
                          'Sign Up',
                          textScaleFactor: 1.4,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onPressed: () {
                          _con.loginbutton();
                        }),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t  have  an account ?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign Up ',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 120,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Or",
                        style: TextStyle(color: Colors.grey),
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(width: 15),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 120,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: RawMaterialButton(
                          onPressed: () {},
                          fillColor: Colors.white,
                          child: Image.asset(
                            'assets/search.png',
                            height: 30,
                            width: 30,
                          ),
                          // padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        child: RawMaterialButton(
                          onPressed: () {},
                          fillColor: Colors.white,
                          child: Image.asset(
                            'assets/facebook.png',
                            height: 30,
                            width: 30,
                          ),
                          // padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Forgot Password?',
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
