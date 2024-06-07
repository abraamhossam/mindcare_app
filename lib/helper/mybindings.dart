import 'package:get/get.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_input_data.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:mindcare_app/controller/moods_controller.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/controller/video_mood_contoller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TestController(), permanent: true);
    Get.put(BottomNavigationBarController());
    Get.put(MoodsController());
    Get.put(VideoMoodController());
    Get.put(GetDetailscontroller());
    Get.put(DoctorInputData());
  }
}
