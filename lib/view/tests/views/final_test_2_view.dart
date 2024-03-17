import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/aniexty_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/result_aniexty_test_view.dart';

class FinalTest2View extends StatelessWidget {
  FinalTest2View({super.key});
  static String id = "/FinalTest2View";
  final AniextyTestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Anxiety Test",
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.height! * 0.03,
              ),
              const Text(
                "Mentall related symptoms",
                style: TextStyle(
                  fontSize: 24,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.02,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: Size(
                    SizeConfig.width! * 0.5,
                    SizeConfig.height! * 0.05,
                  ),
                ),
                onPressed: () {
                  Get.offNamed(
                    ResultAniextyTestView.id,
                    arguments: Get.arguments[1],
                  );
                },
                child: const Text(
                  'Save The Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.01,
              ),
              const Text(
                "OR",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: Size(
                    SizeConfig.width! * 0.6,
                    SizeConfig.height! * 0.05,
                  ),
                ),
                onPressed: () {
                  Get.offNamed(Get.arguments[0]);
                  controller.back();
                },
                child: const Text(
                  'Restart The Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
