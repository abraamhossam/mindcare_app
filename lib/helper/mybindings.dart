import 'package:get/get.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';

import 'package:mindcare_app/controller/recommendations_controller/moods_controller.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TestController(), permanent: true);
    Get.put(BottomNavigationBarController());
    Get.put(MoodsController());
    Get.put(GetDetailscontroller(), permanent: true);
  }
}
