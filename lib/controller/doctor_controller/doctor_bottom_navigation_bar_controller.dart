import 'package:get/get.dart';

class DoctorBottomNavigationBarController extends GetxController {
  RxInt selectIndex = 0.obs;
  void navigate(index) {
    selectIndex.value = index;
  }
}
