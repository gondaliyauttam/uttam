import 'package:flutter/material.dart';
import 'package:flutter_task/screen/Login.dart';
import 'package:flutter_task/screen/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/Homepage':
        return MaterialPageRoute(builder: (_) => Homepage());

      case '/Login':
        return MaterialPageRoute(builder: (_) => Login());
    }
  }
}
