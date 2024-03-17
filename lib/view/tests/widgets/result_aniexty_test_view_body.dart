import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/tests/widgets/test_result_custom.dart';

class ResultAniextyTestViewBody extends StatelessWidget {
  const ResultAniextyTestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TestResultCustom(
      points: Get.arguments,
      totalPoints: 23,
    );
  }
}
