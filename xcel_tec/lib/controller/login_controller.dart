import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:xcel_tec/model/login_model.dart';
import 'package:xcel_tec/repositiory/login_repo.dart';
import 'package:xcel_tec/screen/home.dart';

class Logincontroller extends ControllerMVC {
  LoginUser log = LoginUser();

  GlobalKey<FormState> loginFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;

  Logincontroller() {
    this.loginFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  void loginbutton() async {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      login(log).then(
        (value) {
          // Constants.prefs.setBool("loggedin", true);
          // Constants.prefs.setString('token', value.data.token);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
          BotToast.showText(
              text: 'login success', duration: Duration(seconds: 2));
        },
      );
    }
  }
}
