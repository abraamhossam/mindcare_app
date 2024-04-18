import 'package:flutter/material.dart';
import 'package:mindcare_app/view/admins/widgets/sign_in_admin_view_body.dart';

class SignInAdminView extends StatelessWidget {
  const SignInAdminView({super.key});
  static String id = "/signinadminview";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInAdminViewBody(),
      ),
    );
  }
}
