import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/widgets/test_result_custom.dart';

class ResultADHDTestViewBody extends StatelessWidget {
  const ResultADHDTestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TestResultCustom(
      points: Get.arguments,
      totalPoints: 47,
    );
  }
}
