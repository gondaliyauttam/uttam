import 'package:flutter/material.dart';
import 'package:flutter_task/utils/constance.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        ListTile(
          onTap: () {
            Constants.prefs.setBool("loggedin", false);
            Navigator.of(context).pushReplacementNamed('/Login');
          },
          leading: Icon(Icons.login_outlined),
          title: Text(
            'Logout',
            textScaleFactor: 1.5,
          ),
        ),
      ]),
    );
  }
}
