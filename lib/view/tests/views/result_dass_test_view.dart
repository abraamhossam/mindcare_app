import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_dass_test_view_body.dart';

class ResultDASSTestView extends StatelessWidget {
  const ResultDASSTestView({super.key});
  static String id = "/ResultDASSTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultDASSTestViewBody(),
      ),
    );
  }
}
