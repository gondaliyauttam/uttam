import 'package:bot_toast/bot_toast.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:xcel_tec/model/register_model.dart';
import 'package:http/http.dart' as http;

RegisterModel user = RegisterModel();

Future<RegisterModel> register(RegisterModel reg) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}register';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: <String, dynamic>{
      'email': 'ks123@mailinator.com',
      'password': 'Test@123',
      "full_name": "Keval Shah",
      "country_code": "+91",
      "contact_number": "9033235285",
      "country_code_name": "IN",
      "user_device_id": "postman",
      "fcm_token": "123456",
      "username": "keval20",
      "user_type": "user",
      "login_type": "keval.kaila@xceltec.in"
    },
  );
  if (response.statusCode == 200) {
    var res = response.body;
    print(res);

    return registerModelFromJson(res);
  } else {
    BotToast.showText(text: "user invalid", duration: Duration(seconds: 2));
  }
}
