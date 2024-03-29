import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/tests/widgets/final_test_view_body.dart';

class FinalTestView extends StatelessWidget {
  FinalTestView({super.key});
  static String id = "/FinalTestView";
  final TestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Final Test",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: FinalTestViewBody(controller: controller),
      ),
    );
  }
}
