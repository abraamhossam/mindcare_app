import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/mental_illness_test_view_body.dart';

class MentalIllnessTestView extends StatelessWidget {
  const MentalIllnessTestView({super.key});
  static String id = "/MentalIllnessTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Mental Illness Test",
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
        body: MentalIllnessTestViewBody(),
      ),
    );
  }
}
