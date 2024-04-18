import 'package:get/get.dart';

class ButtonTimeController extends GetxController {
  int index = 0;
  setIndex({required buttonIndex}) {
    index = buttonIndex;
    update();
  }
}
