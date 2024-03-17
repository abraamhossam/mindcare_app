import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/depression_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_4_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_botton.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_question.dart';

class DepressionTestViewBody extends StatelessWidget {
  DepressionTestViewBody({super.key});
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'Little interest or pleasure in doing things',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText': 'Feeling down, depressed or hopeless',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText': 'Poor appetite or overeating',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText':
          'Trouble falling asleep, staying asleep, or sleeping too much',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText': 'Feeling tired or having little energy',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText':
          'Feeling bad about yourself - or that you’re a failure or have let yourself or your family down',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText':
          'Trouble concentrating on things, such as reading the newspaper or watching television',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText':
          'Moving or speaking so slowly that other people could have noticed. Or, the opposite - being so fidgety or restless that you have been moving around a lot more than usual',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
      ]
    },
    {
      'questionText':
          'Thoughts that you would be better off dead or of hurting yourself in some way',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days or Every day', 'score': 1},
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
            return GetBuilder<DepressionTestController>(
              builder: (controller) {
                int result = controller.points;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${controller.index} of 8",
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
                                if (controller.index == 8) {
                                  Get.offNamed(FinalTest4View.id, arguments: [
                                    DepressionTestView.id,
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
