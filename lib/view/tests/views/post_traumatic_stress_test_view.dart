import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/post_traumatic_stress_test_vew_body.dart';

class PostTraumaticStressTestView extends StatelessWidget {
  const PostTraumaticStressTestView({super.key});
  static String id = "/PostTraumaticStressTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Post-Traumatictes Stress Test",
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
        body: PostTraumaticStressTestViewBody(),
      ),
    );
  }
}
