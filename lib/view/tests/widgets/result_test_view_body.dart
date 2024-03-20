import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/widgets/test_result_custom.dart';

class ResultTestViewBody extends StatelessWidget {
  ResultTestViewBody({super.key});
  final TestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TestResultCustom(
      points: controller.points,
      totalPoints: controller.index,
    );
  }
}
