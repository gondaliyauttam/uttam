import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final Function onPressed;

  const Navbar({Key key, this.image, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu_open_outlined,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
      centerTitle: true,
      title: Image.asset(image, height: 30, width: 30, fit: BoxFit.cover),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
