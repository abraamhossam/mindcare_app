import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_body.dart';

class PostTraumaticStressTestView extends StatelessWidget {
  PostTraumaticStressTestView({super.key});
  static String id = "/PostTraumaticStressTestView";
  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'Does it often happen to you to act or feel like the traumatic event is happening again with no possibility of forgeting about it?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to you to avoid participating in activities related in any way to the trauma event you suffered?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to remember a certain event and get all upset about it?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you have difficulty in remembering clearly all the important aspects of the trauma event you suffered?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to you to have nightmares either directly related to the trauma event or any other feelings of fright?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to you to avoid visiting places that are in any way related to the trauma event you suffered?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you always get distressed when you think or remember the trauma that happened to you?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you consider you lost interest in activities you enjoyed doing or in life in general?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you usually suffer extreme physical reactions when remembering the trauma event, such as difficulty breathing, pounding heart, headache or muscle tension?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you consider you lost empathy towards those around you?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you often encounter problems falling asleep or any similar?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Are you afraid that something similar will happen again, a reason why you can not live your life as you wanted before the trauma event?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you consider you became emotionally numb, so that there are many feelings you can not live again?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often have the sensation that your life radically changed such way you can not control and improve it?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often get irritated by insignificant things, that previously did not affect you at the same level as now?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to you to spend hours meditating on the trauma you suffered from?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you consider you lost interest in any future plan you had before the incident, so that you don\'t have a clear target now?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'Do you often encounter difficulty concentrating?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Does it often happen to you to exaggerate taking measures that aim avoiding something happening, so that you spent a lot of energy on them?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you believe others can live happily just because they did not confront with the trauma you suffered?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'You\'ve come to think that in general the important things in life can be changed with difficulty?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you consider that performance in your career or that your family life changed in a negative way after the trauma you suffered and that they can\'t recover?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you experience difficulty listening to people around you because you have your own concern?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'After the trauma you have suffered, do you oftenget the feeling that you have nothing to live for?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
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
        body: TestViewBody(
          page: id,
          totalTest: _questions.length,
          questions: _questions,
        ),
      ),
    );
  }
}
