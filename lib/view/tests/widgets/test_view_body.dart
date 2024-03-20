import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/final_test_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_botton.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_question.dart';

class TestViewBody extends StatelessWidget {
  TestViewBody({
    super.key,
    required this.questions,
    required this.totalTest,
    required this.page,
  });

  final List<Map<String, dynamic>> questions;
  final int totalTest;
  final String page;
  final TestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GetBuilder<TestController>(
            init: TestController(),
            builder: (controller) {
              int result = controller.points;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Question ${controller.index} of ${totalTest - 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.03,
                  ),
                  TestViewQuestion(
                    text: questions[controller.index]['questionText'],
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.02,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.2,
                    width: SizeConfig.width! * 1,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: TestViewButton(
                            data: questions[controller.index]['answers'][index],
                            onPressed: () {
                              if (controller.index == totalTest - 1) {
                                Get.offNamed(FinalTestView.id, arguments: [
                                  page,
                                  result,
                                  totalTest - 1,
                                ]);
                              } else {
                                controller.nextQuestion();
                                controller.pointsScore(
                                  point: questions[controller.index]['answers']
                                      [index]['score'],
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      controller.back();
                    },
                    child: const Text(
                      "back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
