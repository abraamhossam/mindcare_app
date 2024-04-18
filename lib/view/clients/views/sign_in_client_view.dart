import 'package:flutter/material.dart';
import 'package:mindcare_app/view/clients/widgets/sign_in_client_view_body.dart';

class SignInClientView extends StatelessWidget {
  const SignInClientView({super.key});
  static String id = "/signinclientview";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInClientViewBody(),
      ),
    );
  }
}
