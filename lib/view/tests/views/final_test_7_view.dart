import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/social_anxiety_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/result_social_anxiety_test_view.dart';

class FinalTest7View extends StatelessWidget {
  FinalTest7View({super.key});
  static String id = "/FinalTest7View";
  final SocialAnxietyTestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Social Anxiety Test",
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
                    ResultSocialAnxietyTestView.id,
                    arguments: Get.arguments[1],
                  );
                  controller.back();
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
