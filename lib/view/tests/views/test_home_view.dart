import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/test_home_view_body.dart';

class TestHomeView extends StatelessWidget {
  const TestHomeView({super.key});
  static String id = "/TestHomeView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TestHomeViewBody(),
      ),
    );
  }
}
