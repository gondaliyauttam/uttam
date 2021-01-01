import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/model/loginmodel.dart';
import 'package:flutter_task/model/listmodel.dart';
import 'package:flutter_task/utils/constance.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_task/model/socialmodel.dart';

Loginmodel user = Loginmodel();

Future<Loginmodel> login(LoginUser log) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}login';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: <String, dynamic>{
      'email': log.email,
      'password': log.password,
    },
  );
  if (response.statusCode == 200) {
    var res = response.body;

    return loginmodelFromJson(res);
  } else {
    BotToast.showText(text: "user invalid", duration: Duration(seconds: 2));
  }
}

Future<SocialModel> sociallogin(LoginUser log) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}social-login';
  final client = new http.Client();
  final response = await client.post(url, body: <String, dynamic>{
    "email": "employer@gmail.com",
    "one_signal_id": ""
  });
  if (response.statusCode == 200) {
    var res = response.body;
    return socialModelFromJson(res);
  }
}

Future<ListModel> listdetails() async {
  String token = Constants.prefs.getString("token");
  print(token);

  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}employer/workers/search?page=0';
  final client = new http.Client();
  final response = await client.post(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  body:
  jsonEncode(
      <String, String>{"email": "employer@gmail.com", "one_signal_id": ""});

  if (response.statusCode == 200) {
    var res = response.body;
    print('apitesting');
    print(res);
    return listModelFromJson(res);
  }
}
