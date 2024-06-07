import 'package:flutter/material.dart';
import 'package:mindcare_app/view/Doctors/widgets/sign_up_doctor_view_body.dart';

class SignUpDoctorView extends StatelessWidget {
  const SignUpDoctorView({super.key});
  static String id = "/singupdoctor";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpDoctorViewBody(),
      ),
    );
  }
}
