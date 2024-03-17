import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/controller/test_controller/post_traumatic_stress_test_controller.dart';
import 'package:mindcare_app/view/tests/widgets/test_result_custom.dart';

class ResultPostTraumaticStressTestViewBody extends StatelessWidget {
  ResultPostTraumaticStressTestViewBody({super.key});
  final PostTraumaticStressTestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return TestResultCustom(
      points: Get.arguments,
      totalPoints: 23,
    );
  }
}
