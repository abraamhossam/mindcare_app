import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_social_anxiety_test_view_body.dart';

class ResultSocialAnxietyTestView extends StatelessWidget {
  const ResultSocialAnxietyTestView({super.key});
  static String id = "/ResultSocialAnxietyTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultSocialAnxietyTestViewBody(),
      ),
    );
  }
}
