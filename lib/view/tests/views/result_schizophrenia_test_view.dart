import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_schizophrenia_test_view_body.dart';

class ResultSchizophreniaTestView extends StatelessWidget {
  const ResultSchizophreniaTestView({super.key});
  static String id = "/ResultSchizophreniaTestView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResultSchizophreniaTestViewBody(),
      ),
    );
  }
}
