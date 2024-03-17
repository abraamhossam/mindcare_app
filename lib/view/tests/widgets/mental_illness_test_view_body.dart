import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/mental_illness_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/final_test_5_view.dart';
import 'package:mindcare_app/view/tests/views/mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_botton.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_question.dart';

class MentalIllnessTestViewBody extends StatelessWidget {
  MentalIllnessTestViewBody({super.key});
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText':
          'Do you often experience confusion when thinking about your life path and long term goals?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you currently avoid any social contact or being with your friends as you previously used to?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often experience problems falling asleep or in full sleeping over night?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often experience trouble aknowledging people or facts around you, so that you react in an unappropriate way?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Did you radically changed your eating habits over the past few weeks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Over the past few weeks, have you done anything to hurt youself on purpose?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it ever happen to you to start talking on your own out loud?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often experience sadness or down feelings?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you frequently change your mood in an extreme way from highs to lows, or reverse?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often think negatively rather than positively?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often feel over stressed?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Did you often have the sensation of hearing voices over the past few weeks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often experience low self-esteem feelings?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you experience extreme fear, worry or angry feelings that make you lose your mind or inner balance?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Did you exhibit any violent behaviour over the past few weeks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you ever have hallucinations problems?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Did you often think about suicide, over the past few weeks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often have problems in keeping focus?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often have problems in keeping focus?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you suffer from alcoholic or banned substances abuse?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often experience paranoia feelings?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Did you radically change your sex drive habits over the past few weeks?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you experience low energy issues?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often feel you can not handle daily problems or activities, so that you avoid as many of them as you can?',
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
            return GetBuilder<MentalIllnessTestController>(
              builder: (controller) {
                int result = controller.points;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${controller.index} of 23",
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
                                if (controller.index == 23) {
                                  Get.offNamed(FinalTest5View.id, arguments: [
                                    MentalIllnessTestView.id,
                                    result
                                  ]);
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
