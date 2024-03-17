import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/controller/test_controller/depression_test_controller.dart';
import 'package:mindcare_app/view/tests/widgets/test_result_custom.dart';

class ResultDepressionTestViewBody extends StatelessWidget {
  ResultDepressionTestViewBody({super.key});
  final DepressionTestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return TestResultCustom(
      points: Get.arguments,
      totalPoints: 8,
    );
  }
}
