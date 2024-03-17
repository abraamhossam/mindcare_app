import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/adhd_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_1_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_botton.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_question.dart';

class ADHDTestViewBody extends StatelessWidget {
  ADHDTestViewBody({super.key});
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'Difficulties finishing projects in due time.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Inabillity to learn from mistakes.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from hot temper.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Speaking innapropriate things without thinking.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          ' Frequently loose things that are used on a daily basis.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to doubt even for the simple things.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Often loosing track of time.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Forgeting about certain deadlines and appoinments.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Being rude without even realizing it.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from indecision.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Trouble following certain instructions.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Finding hard to complete tasks.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Trouble following a conversation. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Finding hard to follow procedures. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to interupt others when they speak.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Trouble keeping own motivation.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to get bored easily.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Difficulties initiating something. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to ignore or overlook details.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Trouble relaxing. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Tendency to talk over people.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Trouble dealing with frustration.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Forgeting about commitments.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Being stressed out for no reason. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Irresponsible behavior.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Trouble prioritizing issues.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Trouble dealing with criticism. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Act without taking account of consequences. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to procrastinate. ',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to underestimate personal achievements.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Difficulty focusing on mundane tasks.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to act without thinking.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' None or poor organizational skills.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to try too many activities at once.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Finding hard to stay on track.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Making mistakes on the same things.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from low self-esteem.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from mood swings.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Constantly feeling agitation for no reason.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from inner restlessness.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to underestimate time to complete a task.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Having innapropriate social behavior.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Difficulties in active listening.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Seem to always be late.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Avoidance of mental effort.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Being irritated for no reason.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Suffering from a sense of insecurity.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': ' Tendency to ignore risks.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: SizedBox(
        height: SizeConfig.height! * 0.6,
        child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GetBuilder<ADHDTestController>(
              init: ADHDTestController(),
              builder: (controller) {
                int result = controller.points;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${controller.index} of 47",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.03,
                    ),
                    TestViewQuestion(
                      text: _questions[controller.index]['questionText'],
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
                              data: _questions[controller.index]['answers']
                                  [index],
                              onPressed: () {
                                if (controller.index == 47) {
                                  Get.offNamed(FinalTest1View.id,
                                      arguments: [ADHDTestView.id, result]);
                                } else {
                                  controller.nextQuestion();
                                  controller.pointsScore(
                                    point: _questions[controller.index]
                                        ['answers'][index]['score'],
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
      ),
    );
  }
}
