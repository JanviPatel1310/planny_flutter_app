import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isSelected = false;

  void isSetSelected(bool value) {
    isSelected = value;

    print('hahahahaah$value');
    update();
  }
}
