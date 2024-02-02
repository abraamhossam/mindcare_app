import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/drop_down_view.dart';
import 'package:mindcare_app/view/init_view.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_in_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';
import 'package:mindcare_app/view/splash_view.dart';

void main() {
  runApp(
    const MindCareApp(),
  );
}

class MindCareApp extends StatelessWidget {
  const MindCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: SplashView.id,
          page: () => const SplashView(),
        ),
        GetPage(
          name: InitView.id,
          page: () => const InitView(),
        ),
        GetPage(
          name: DropDownView.id,
          page: () => const DropDownView(),
        ),
        GetPage(
          name: SignInView.id,
          page: () => const SignInView(),
        ),
        GetPage(
          name: SignUpView.id,
          page: () => const SignUpView(),
        ),
        GetPage(
          name: ResetView.id,
          page: () => const ResetView(),
        ),
      ],
      initialRoute: SplashView.id,
    );
  }
}
