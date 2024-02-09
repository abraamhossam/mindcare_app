import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/home_page.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/test_page.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/init_view.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_in_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';
import 'package:mindcare_app/view/splash_view.dart';
import 'view/widgets/pay_view.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontFamily,
      ),
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
        GetPage(
          name: PayView.id,
          page: () => const PayView(),
        ),
        // ............سكرينات السنوسي.. ............
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/mental_tests',
          page: () => const mentalTests(),
        ),
      ],
      //initialRoute: SplashView.id,
      initialRoute: "/home",
    );
  }
}
