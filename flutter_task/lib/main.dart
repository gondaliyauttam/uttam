import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/screen/Login.dart';
import 'package:flutter_task/screen/home.dart';
import 'package:flutter_task/utils/constance.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_task/route/route_generator.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration().loadFromAsset("configuration");
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.RouteGenerator.generateRoute,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      title: 'Flutter task',
      home: Constants.prefs.getBool('loggedin') == true ? Homepage() : Login(),
    );
  }
}
