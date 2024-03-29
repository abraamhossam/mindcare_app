import 'package:get/get.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_bottom_navigation_bar_controller.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TestController(), permanent: true);
    Get.put(DoctorBottomNavigationBarController());
  }
}
