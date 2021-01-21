import 'package:global_configuration/global_configuration.dart';
import 'package:uttam_practical_7_1_2021/model/homemodel.dart';
import 'package:http/http.dart' as http;

Future<HomeModel> homeimage(size) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}api.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: <String, dynamic>{
      'size': size,
    },
  );
  if (response.statusCode == 200) {
    var res = response.body;
    return homeModelFromJson(res);
  }
}
