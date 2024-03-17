import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_mental_illness_test_view_body.dart';

class ResultMentalIllnessTestView extends StatelessWidget {
  const ResultMentalIllnessTestView({super.key});
  static String id = "/ResultMentalIllnessTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultMentalIllnessTestViewBody(),
      ),
    );
  }
}
