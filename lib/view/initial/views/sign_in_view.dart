import 'package:flutter/material.dart';
import 'package:mindcare_app/view/initial/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static String id = "/signin";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
