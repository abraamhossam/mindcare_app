import 'package:flutter/material.dart';

import 'sign_up_view_body_doctors.dart';

class SignUpViewDoctors extends StatelessWidget {
  const SignUpViewDoctors({super.key});
  static String id = "/singupdoctor";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpViewBodyDoctors(),
      ),
    );
  }
}
