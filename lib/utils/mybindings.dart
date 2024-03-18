import 'package:get/get.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_bottom_navigation_bar_controller.dart';
import 'package:mindcare_app/controller/test_controller/adhd_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/aniexty_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/dass_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/depression_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/mental_illness_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/post_traumatic_stress_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/schizophrenia_test_controller.dart';
import 'package:mindcare_app/controller/test_controller/social_anxiety_test_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ADHDTestController());
    Get.put(AniextyTestController());
    Get.put(DASSTestController());
    Get.put(DepressionTestController());
    Get.put(MentalIllnessTestController());
    Get.put(PostTraumaticStressTestController());
    Get.put(SchizophreniaTestController());
    Get.put(SocialAnxietyTestController());
    Get.put(DoctorBottomNavigationBarController());
  }
}
