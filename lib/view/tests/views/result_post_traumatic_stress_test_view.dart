import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_post_traumatic_stress_test_view_body.dart';

class ResultPostTraumaticStressTestView extends StatelessWidget {
  const ResultPostTraumaticStressTestView({super.key});
  static String id = "/ResultPostTraumaticStressTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultPostTraumaticStressTestViewBody(),
      ),
    );
  }
}
