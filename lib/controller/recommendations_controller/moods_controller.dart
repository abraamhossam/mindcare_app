import 'package:get/get.dart';

class MoodsController extends GetxController {
  RxInt pos = 0.obs;
  next({required int index}) {
    pos.value = index;
  }
}
