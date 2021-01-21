import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:uttam_practical_7_1_2021/model/homemodel.dart';

import 'package:uttam_practical_7_1_2021/repo/home_repo.dart';

class HomeimageController extends ControllerMVC {
  List<Datum> datum = new List<Datum>();
  bool isLoading = false;

  // HomeimageController() {
  void getImage(String text) {
    setState(() {
      isLoading = true;
    });
    homeimage(text).then((value) {
      setState(() {
        datum = value.data;
        isLoading = false;
      });
    });
  }
}
