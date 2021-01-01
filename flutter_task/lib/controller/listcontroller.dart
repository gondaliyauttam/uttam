import 'package:flutter/material.dart';
import 'package:flutter_task/repositiory/login_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_task/model/listmodel.dart';

class ListController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //List<Datum> datum;
  List<Datum> datum = new List<Datum>();
  Datum dataa;

  ListController() {
    listdetails().then((value) {
      setState(() {
        datum = value.data.data;
      });
    });
  }
}
