import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/model/loginmodel.dart';
import 'package:flutter_task/repositiory/login_repo.dart';
import 'package:flutter_task/utils/constance.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
          Constants.prefs.setBool("loggedin", true);
          Constants.prefs.setString('token', value.data.token);
          Navigator.of(context).pushReplacementNamed('/Homepage');
          BotToast.showText(
              text: 'login success', duration: Duration(seconds: 2));
        },
      );
    }
  }

  void sociallogbutton() async {
    login(log).then(
      (value) {
        BotToast.showText(text: "Login Completed Successfully");
        Constants.prefs.setBool("loggedin", true);
        Navigator.of(context).pushReplacementNamed('/Homepage');
      },
    );
  }
}
