import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_body.dart';

class DepressionTestView extends StatelessWidget {
  DepressionTestView({super.key});
  static String id = "/DepressionTestView";
  final List<Map<String, Object>> _questions = [
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Depression Test",
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
        body: TestViewBody(
          page: id,
          totalTest: _questions.length,
          questions: _questions,
        ),
      ),
    );
  }
}
