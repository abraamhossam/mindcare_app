import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_test_view_body.dart';

class ResultADHDTestView extends StatelessWidget {
  const ResultADHDTestView({super.key});
  static String id = "/ResultADHDTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultTestViewBody(),
      ),
    );
  }
}
