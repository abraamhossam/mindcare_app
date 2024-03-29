import 'package:flutter/material.dart';
import 'package:mindcare_app/view/initial/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = "/SplashView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
