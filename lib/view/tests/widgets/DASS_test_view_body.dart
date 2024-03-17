import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/dass_test_controller.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_3_view.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_botton.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_question.dart';

class DASSTestViewBody extends StatelessWidget {
  DASSTestViewBody({super.key});
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'I found myself getting upset by quite trivial things',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I was aware of dryness of my mouth',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I couldn’t seem to experience any positive feeling at all',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I experienced breathing difficulty (eg, excessively rapid breathing, breathlessness in the absence of physical exertion)',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I just couldn\'t seem to get going',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I tended to over-react to situations',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I had a feeling of shakiness (eg, legs going to give way)',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I found it difficult to relax',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I found myself in situations that made me so anxious I was most relieved when they ended',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt that I had nothing to look forward to',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I found myself getting upset rather easily',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I felt that I was using a lot of nervous energy',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I felt sad and depressed',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          ' I found myself getting impatient when I was delayed in any way (eg, lifts, traffic lights, being kept waiting)',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I had a feeling of faintness',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I felt that I had lost interest in just about everything',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt I wasn\'t worth much as a person',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I felt that I was rather touchy',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I perspired noticeably (eg, hands sweaty) in the absence of high temperatures or physical exertion',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt scared without any good reason',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt that life wasn\'t worthwhile',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I found it hard to wind down',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I had difficulty in swallowing',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I couldn\'t seem to get any enjoyment out of the things I did',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I was aware of the action of my heart in the absence of physical exertion (eg, sense of heart rate increase, heart missing a beat)',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt down-hearted and blue',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I found that I was very irritable',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I felt I was close to panic',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I found it hard to calm down after something upset me',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I feared that I would be \'thrown\' by some trivial but unfamiliar task',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I was unable to become enthusiastic about anything',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I found it difficult to tolerate interruptions to what I was doing',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I was in a state of nervous tension',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt I was pretty worthless',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I was intolerant of anything that kept me from getting on with what I was doing',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I felt terrified',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I could see nothing in the future to be hopeful about',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I felt that life was meaningless',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': 'I found myself getting agitated',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          ' I was worried about situations in which I might panic and make a fool of myself',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText': ' I experienced trembling (eg, in the hands)',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
      ]
    },
    {
      'questionText':
          'I found it difficult to work up the initiative to do things',
      'answers': [
        {'text': ' Never', 'score': 0},
        {'text': ' Sometimes or Almost Always', 'score': 1},
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
            return GetBuilder<DASSTestController>(
              builder: (controller) {
                int result = controller.points;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${controller.index} of 41",
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
                                if (controller.index == 41) {
                                  Get.offNamed(FinalTest3View.id,
                                      arguments: [DASSTestView.id, result]);
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
