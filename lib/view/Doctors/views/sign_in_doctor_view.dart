import 'package:flutter/material.dart';
import 'package:mindcare_app/view/Doctors/widgets/sign_in_doctor_view_body.dart';

class SignInDoctorView extends StatelessWidget {
  const SignInDoctorView({super.key});
  static String id = "/signindoctorview";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInDoctorViewBody(),
      ),
    );
  }
}
