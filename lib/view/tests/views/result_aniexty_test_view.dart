import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/result_aniexty_test_view_body.dart';

class ResultAniextyTestView extends StatelessWidget {
  const ResultAniextyTestView({super.key});
  static String id = "/ResultAniextyTestView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ResultAniextyTestViewBody(),
      ),
    );
  }
}
