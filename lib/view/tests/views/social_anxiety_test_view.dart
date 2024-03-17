import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/social_anxiety_test_vew_body.dart';

class SocialAnxietyTestView extends StatelessWidget {
  const SocialAnxietyTestView({super.key});
  static String id = "/SocialAnxietyTestView";
  @override
  Widget build(BuildContext context) {
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
        body: SocialAnxietyTestViewBody(),
      ),
    );
  }
}
