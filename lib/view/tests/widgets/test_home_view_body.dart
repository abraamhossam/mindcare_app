import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/aniexty_test_vew.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/views/post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/tests/views/schizophrenia_test_view.dart';
import 'package:mindcare_app/view/tests/views/social_anxiety_test_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_type_iteam.dart';

class TestHomeViewBody extends StatelessWidget {
  TestHomeViewBody({super.key});
  final List<Map<String, String>> listData = [
    {
      "testname": "ADHD",
      "view": ADHDTestView.id,
    },
    {
      "testname": "Anxiety",
      "view": AniextyTestView.id,
    },
    {
      "testname": "DASS",
      "view": DASSTestView.id,
    },
    {
      "testname": "Depression",
      "view": DepressionTestView.id,
    },
    {
      "testname": "Mental illness",
      "view": MentalIllnessTestView.id,
    },
    {
      "testname": "Schizophrenia",
      "view": SchizophreniaTestView.id,
    },
    {
      "testname": "Social Anxiety",
      "view": SocialAnxietyTestView.id,
    },
    {
      "testname": "Post-traumatic stress",
      "view": PostTraumaticStressTestView.id,
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.height! * 0.01,
        ),
        const Text(
          "Mental Tests which you needed",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.01,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: GridView.builder(
                itemCount: listData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return TestTypeIteam(
                    ontap: () {
                      Get.toNamed(listData[index]["view"]!);
                    },
                    text: listData[index]["testname"]!,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
