import 'package:flutter/material.dart';
import 'package:mindcare_app/view/clients/widgets/sign_up_client_view_body.dart';

class SignUpClientView extends StatelessWidget {
  const SignUpClientView({super.key});
  static String id = "/singupclientview";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpClientViewBody(),
      ),
    );
  }
}
