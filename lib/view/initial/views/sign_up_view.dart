import 'package:flutter/material.dart';
import 'package:mindcare_app/view/initial/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = "/singup";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
