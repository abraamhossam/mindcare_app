import 'package:get/get.dart';

class MoodsController extends GetxController {
  int pos = 0;
  next({required int index}) {
    pos = index;
    update();
  }
}
