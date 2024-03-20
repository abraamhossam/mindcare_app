import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/tests/widgets/test_view_body.dart';

class DASSTestView extends StatelessWidget {
  DASSTestView({super.key});
  static String id = "/DASSTestView";
  final List<Map<String, Object>> _questions = [
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "DASS Test",
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
