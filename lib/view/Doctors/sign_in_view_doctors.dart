import 'package:flutter/material.dart';

import 'sign_in_view_body_doctors.dart';

class SignInViewDoctors extends StatelessWidget {
  const SignInViewDoctors({super.key});
  static String id = "/signindoctor";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInViewBodyDoctors(),
      ),
    );
  }
}
