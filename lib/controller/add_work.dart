import 'package:get/get.dart';

class AddWork extends GetxController {
  int index = 1;
  void add() {
    index++;
    update();
  }
}
