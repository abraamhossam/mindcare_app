import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/tests/views/adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/aniexty_test_vew.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/views/post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/tests/views/schizophrenia_test_view.dart';
import 'package:mindcare_app/view/tests/views/social_anxiety_test_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_type_iteam.dart';
import 'package:mindcare_app/view/widgets/mental_illness_history_body.dart';

class ClientTestBody extends StatelessWidget {
  ClientTestBody({super.key});
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
  final TestController controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          indicatorWeight: 4,
          indicatorColor: kPrimaryColor,
          labelPadding: EdgeInsets.zero,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
              child: Text(
                "Tests",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Tab(
              child: Text(
                "History",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: GridView.builder(
                  itemCount: listData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 2.2 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return TestTypeIteam(
                      ontap: () {
                        Get.toNamed(listData[index]["view"]!);
                        controller.back();
                      },
                      text: listData[index]["testname"]!,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: ListTileWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
