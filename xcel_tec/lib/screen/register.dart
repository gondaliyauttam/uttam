import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:xcel_tec/screen/Login.dart';
import 'package:xcel_tec/controller/register_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends StateMVC<Register> {
  Registercontroller _con;
  _RegisterState() : super(Registercontroller()) {
    _con = controller;
  }
  bool _value = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  String dialCode = "+91";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _con.registerFormKey,
              child: ListView(
                children: [
                  Container(
                    child: Center(child: Image.asset('assets/xcel_tec.png')),
                    height: 180,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onSaved: (input) => _con.reg.data.fullName = input,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      filled: false,
                      labelText: 'Full name',
                      hintText: 'Full name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter full Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onSaved: (input) => _con.reg.data.username = input,
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
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => _con.reg.data.email = input,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      filled: false,
                      labelText: 'Email id',
                      hintText: 'Email id',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Email id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: CountryCodePicker(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          onChanged: (country) {
                            print(country.dialCode);
                            dialCode = country.dialCode;
                          },
                          showFlag: false,
                          hideSearch: false,
                          initialSelection: 'IN',
                          showFlagDialog: true,
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Colors.black54,
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onSaved: (input) =>
                              _con.reg.data.contactNumber = input,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: false,
                            labelText: 'Phone number',
                            hintText: 'Phone number',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black54,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (input) => _con.reg.data.pinset = input,
                    obscureText: _obscureText,
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
                  SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (input) => _con.reg.data.pinset = input,
                    obscureText: _obscureText1,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      filled: false,
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      suffixIcon: new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText1 = !_obscureText1;
                          });
                        },
                        child: new Icon(_obscureText1
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.black),
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: _value ? Colors.green : Colors.red,
                          value: _value,
                          onChanged: (bool newValue) {
                            setState(() {
                              _value = newValue;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                            text: 'I agree ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms ',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              TextSpan(
                                  text: '&',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: ' Conditions ',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          _con.registerbutton();
                        }),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
