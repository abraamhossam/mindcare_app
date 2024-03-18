import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  static String id = "/testview";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
