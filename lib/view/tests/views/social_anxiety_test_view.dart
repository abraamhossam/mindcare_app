import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_body.dart';

class SocialAnxietyTestView extends StatelessWidget {
  SocialAnxietyTestView({super.key});
  static String id = "/SocialAnxietyTestView";
  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'Do you often feel uncomfortable and terrified about how you will be presented to other people?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you feel overly self-conscious and try to pay too much attention to the image or actions you make?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often set high performance standards for yourself, so that to be sure you have to work a lot to succeed?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'When faced with a situation in which you need to create a good impression do you strongly believe that you are unable to do it no matter the efforts you are making?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you have the tendency to believe that your performance was unsatisfactory even though people around encourage you that everything was perfect?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often stay and analyze what was embarrassing about you in public?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you often feel uncomfortable when being in the spotlight?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you tend to remember vividly unpleasant or negative memories rather than pleasant and positive memories?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I avoid going into restaurants, hotels or similar public spaces where I have to talk to unknown people.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I feel very uncomfortable when I have to take physical examinations.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'I do not have that much confidence in myself.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'When I speak to people I can not avoid thinking how they see my speech.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'I fear being judged by people around me.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you tend to isolate from society just to avoid any possible embarrassment or similar feelings?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you have difficulties integrating and socializing in large groups?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'When speaking to different people (especially people you don\'t know well) do you tend to avoid eye contact?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you blush when somebody you do not know is talking to you?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'Do you worry that much how you walk in front of others in such way that you often are at risk of losing your balance?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'When socializing or meeting new people do sweat excessively or experience nausea, difficulty breathing, palpitations or shaking?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I feel uncomfortable when I have to enter a room in which people are waiting for me.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I feel uncomfortable when my daily routine, work, school or any activities are affected by unknown events.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText': 'I have difficulties talking in public.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I feel uncomfortable when I have to initiate a conversation.',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 1},
      ]
    },
    {
      'questionText':
          'I try to avoid as much as I can using public telephone or restroom.',
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
            "Social Anxiety Test",
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
            ),
          ),
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
