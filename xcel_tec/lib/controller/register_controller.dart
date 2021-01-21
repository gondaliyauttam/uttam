import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:xcel_tec/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:xcel_tec/repositiory/reg_repo.dart';
import 'package:bot_toast/bot_toast.dart';

class Registercontroller extends ControllerMVC {
  RegisterModel reg = RegisterModel();
  GlobalKey<FormState> registerFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;

  Registercontroller() {
    this.registerFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void registerbutton() async {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      register(reg).then(
        (value) {
          // Constants.prefs.setBool("loggedin", true);
          // Constants.prefs.setString('token', value.data.token);
          // Navigator.of(context).pushReplacementNamed('/Homepage');
          BotToast.showText(
              text: 'Register success', duration: Duration(seconds: 2));
        },
      );
    }
  }
}
