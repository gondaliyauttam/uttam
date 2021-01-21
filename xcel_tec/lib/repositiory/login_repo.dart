import 'package:bot_toast/bot_toast.dart';
import 'package:xcel_tec/model/login_model.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

LoginModel user = LoginModel();

Future<LoginModel> login(LoginUser log) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}login';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: <String, dynamic>{
      'email': log.username,
      'password': log.password,
    },
  );
  if (response.statusCode == 200) {
    var res = response.body;

    return loginModelFromJson(res);
  } else {
    BotToast.showText(text: "user invalid", duration: Duration(seconds: 2));
  }
}
