import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_depression_test_view_body.dart';

class ResultDepressionTestView extends StatelessWidget {
  const ResultDepressionTestView({super.key});
  static String id = "/ResultDepressionTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultDepressionTestViewBody(),
      ),
    );
  }
}
